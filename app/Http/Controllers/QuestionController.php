<?php

namespace App\Http\Controllers;

use App\Services\QuestionClassifyService;
use App\Services\TimeService;
use App\Services\TokenizerService;
use Carbon\Carbon;
use Phpml\SupportVectorMachine\Kernel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Phpml\Classification\SVC;
use Phpml\FeatureExtraction\TfIdfTransformer;
use Phpml\FeatureExtraction\TokenCountVectorizer;
use Phpml\ModelManager;
use Phpml\Tokenization\WhitespaceTokenizer;
use Psy\Util\Json;

class QuestionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','register']]);

    }

    public function postQuestion(Request $request)
    {
        $slug = $request->question;
        if(strlen($slug) > 100)
        {
            $slug = substr($slug,0,100);
        }

        $slug = str_slug($slug,'-').'-'.Carbon::now()->timestamp;


        $questionClassify = new QuestionClassifyService();
        $class = $questionClassify->QuestionClassify($request->question);

        $tokenizer = new TokenizerService();
        $feature = $tokenizer->stopWord($request->question);

        $arr_question = explode(' ',$feature);
        $tudongnghia = DB::table('seed')->get();
        for($i = 0; $i < count($arr_question); $i++)
        {
            for($j=0;$j < count($tudongnghia); $j++)
            {
                if($arr_question[$i] == $tudongnghia[$j]->word)
                {
                    $arr_question[$i] = $tudongnghia[$j]->sample;
                    break;
                }

            }
        }
        $feature = join(' ',$arr_question);


        DB::table('dataset_question')->insert([
            'class' => $class,
            'question' => $tokenizer->Tokenizer($request->question)
        ]);

        $save = DB::table('question')->insert([
            'id_user' => auth()->user()->id,
            'slug' => $slug,
            'content' => $request->question,
            'class' => $class,
            'feature' => $feature,
            'tag' => json_encode($request->tags,JSON_UNESCAPED_UNICODE),
            'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
            'updated_at' => Carbon::now('Asia/Ho_Chi_Minh')
        ]);

        if($save)
        {
            $tags = $request->tags;
            foreach ($tags as $tag)
            {
                $slug_tag = str_slug($tag['text'],'-');

                $check_slug_tag = DB::table('tag')->where('slug',$slug_tag)->first();
                if($check_slug_tag == null)
                {
                    DB::table('tag')->insert([
                        'name_tag' => $tag['text'],
                        'slug' => $slug_tag,
                        'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                        'updated_at' => Carbon::now('Asia/Ho_Chi_Minh')
                    ]);
                }

            }

        }

    }


    public function trainQuestion()
    {
        $samples = [];
        $labels = [];

        $data = DB::table('dataset_question')->get();

        foreach ($data as $value)
        {
            array_push($labels,$value->class);
            array_push($samples,$value->question);
        }

        //chuyển về ma trận số
        $vectorizer = new TokenCountVectorizer(new WhitespaceTokenizer());
        $vectorizer->fit($samples);
        $vocabulary  = $vectorizer->getVocabulary();
       // dd($vocabulary);
        $vectorizer->transform($samples);

        //đếm tần xuất quan trọng
        $transformer = new TfIdfTransformer($samples);
        $transformer->transform($samples);

        // phân lớp
        $classifier = new SVC(Kernel::RBF, $cost = 1000);
        $classifier->train($samples, $labels);


//        $data = ['tại_sao chúng_ta nên khởi_nghiệp'];
//
//
//        $vectorizer2 = new TokenCountVectorizer(new WhitespaceTokenizer());
//        $vectorizer2->fit($data);
//        $vectorizer->transform($data);
//        $transformer->transform($data);

        $filepath = public_path('dataset\model\model');

        $modelManager = new ModelManager();
        $modelManager->saveToFile($classifier, $filepath);
        return response()->json(['message'=>'success'],200,[],JSON_UNESCAPED_UNICODE);
    }

    //===========================================================================================

    public function getQuestionBySlug(Request $request)
    {
        $question = DB::table('question')
        ->select('users.full_name','users.avatar','question.*')
        ->join('users','question.id_user','=','users.id')
        ->where('slug',$request->slug)->first();

        if($question)
        {
            $question->time = TimeService::time_ago($question->created_at);

            $answers = DB::table('answer')
            ->select('users.full_name','users.avatar','answer.*')
            ->join('users','answer.id_user','=','users.id')
            ->where('id_question',$question->id)
            ->orderBy('num_like','DESC')->get();

            for ($i = 0;$i < count($answers);$i++) 
            {
                $answers[$i]->time = TimeService::time_ago($answers[$i]->created_at);
                
                $liked = DB::table('vote_answer')
                     ->where('id_answer',$answers[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

                if($liked)
                    $answers[$i]->liked = true;
                else
                    $answers[$i]->liked = false;

                $disLiked = DB::table('vote_answer')
                    ->where('id_answer',$answers[$i]->id)
                    ->where('id_user',auth()->user()->id)
                    ->where('type',0)->first();

                if($disLiked)
                    $answers[$i]->disliked = true;
                else
                    $answers[$i]->disliked = false;
            }


            $question->answers = $answers;

            $liked = DB::table('vote_question')
                 ->where('id_question',$question->id)
                 ->where('id_user',auth()->user()->id)
                 ->where('type',1)->first();

            $favorited = DB::Table('favorite')
                ->where('id_user',auth()->user()->id)
                ->where('id_question',$question->id)
                ->first();

            if($favorited)
                $question->favorited = true;
            else
                $question->favorited = false;

            if($liked)
                $question->liked = true;
            else
                $question->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$question->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $question->disliked = true;
            else
                $question->disliked = false;

            return response()->json($question,200,[],JSON_UNESCAPED_UNICODE);

        }
        else
            return response()->json(['message'=>'404'],404,[],JSON_UNESCAPED_UNICODE);

    }


    public function getQuestion(Request $request)
    {

        $listQuestion = DB::table('question')
            ->select('users.full_name','users.avatar','question.*')
            ->join('users','question.id_user','=','users.id')
            ->orderBy('created_at','DESC')
            ->offset($request->page)->limit(4)->get();


        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();


            $favorited = DB::Table('favorite')
                ->where('id_user',auth()->user()->id)
                ->where('id_question',$listQuestion[$i]->id)
                ->first();

            if($favorited)
                $listQuestion[$i]->favorited = true;
            else
                $listQuestion[$i]->favorited = false;

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }


    public function Search(Request $request)
    {
        $listQuestion = DB::select(
            DB::raw("SELECT question.* FROM question WHERE MATCH(content) AGAINST('$request->key')"));

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }

    //===============================================================================================
    public function getNotAnswer(Request $request)
    {
        $listQuestion = DB::table('question')
            ->select('users.full_name','users.avatar','question.*')
            ->join('users','question.id_user','=','users.id')
            ->where('num_answer',0)
            ->orderBy('num_like','DESC')
            ->offset($request->page)->limit(4)->get();


        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();


            $favorited = DB::Table('favorite')
                ->where('id_user',auth()->user()->id)
                ->where('id_question',$listQuestion[$i]->id)
                ->first();

            if($favorited)
                $listQuestion[$i]->favorited = true;
            else
                $listQuestion[$i]->favorited = false;

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }


    public function getHasAnswer(Request $request)
    {
        $listQuestion = DB::table('question')
            ->select('users.full_name','users.avatar','question.*')
            ->join('users','question.id_user','=','users.id')
            ->where('num_answer','>',0)
            ->orderBy('num_like','DESC')
            ->offset($request->page)->limit(4)->get();


        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();


            $favorited = DB::Table('favorite')
                ->where('id_user',auth()->user()->id)
                ->where('id_question',$listQuestion[$i]->id)
                ->first();

            if($favorited)
                $listQuestion[$i]->favorited = true;
            else
                $listQuestion[$i]->favorited = false;

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }


    public function getFavorite(Request $request)
    {
        $listQuestion = DB::table('question')
            ->select('users.full_name','users.avatar','question.*','favorite.id_user')
            ->join('users','question.id_user','=','users.id')
            ->join('favorite','favorite.id_question','=','question.id')
            ->where('favorite.id_user',auth()->user()->id)
            ->offset($request->page)->limit(4)->get();

        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

             $listQuestion[$i]->favorited = true;

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }

    public function getHighLight(Request $request)
    {
        $listQuestion = DB::select(DB::raw('select users.full_name,users.avatar,question.*, (num_like+num_dislike+num_answer) as highlight from question inner join users on question.id_user = users.id order by highlight desc limit 4 offset '.$request->page));


        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();


            $favorited = DB::Table('favorite')
                ->where('id_user',auth()->user()->id)
                ->where('id_question',$listQuestion[$i]->id)
                ->first();

            if($favorited)
                $listQuestion[$i]->favorited = true;
            else
                $listQuestion[$i]->favorited = false;

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }


    public function getVote(Request $request)
    {
         $listQuestion = DB::table('question')
            ->select('users.full_name','users.avatar','question.*')
            ->join('users','question.id_user','=','users.id')
            ->orderBy('num_like','DESC')
            ->offset($request->page)->limit(4)->get();

        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

             $listQuestion[$i]->favorited = true;

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }

    public function inDay(Request $request)
    {
        
        $listQuestion = DB::select(DB::raw(' select users.full_name, users.avatar,question.* from question inner join users on question.id_user = users.id where DAYOFYEAR(question.created_at) = DAYOFYEAR(CURDATE()) limit 4 offset '.$request->page));

        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

             $listQuestion[$i]->favorited = true;

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }

    public function inWeek(Request $request)
    {
        
        $listQuestion = DB::select(DB::raw(' select users.full_name, users.avatar,question.* from question inner join users on question.id_user = users.id where WEEKOFYEAR(question.created_at) = WEEKOFYEAR(CURDATE()) limit 4 offset '.$request->page));

        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

             $listQuestion[$i]->favorited = true;

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }


    public function inMonth(Request $request)
    {
        
        $listQuestion = DB::select(DB::raw(' select users.full_name, users.avatar,question.* from question inner join users on question.id_user = users.id where MONTH(question.created_at) = MONTH(CURDATE()) limit 4 offset '.$request->page));

        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

             $listQuestion[$i]->favorited = true;

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }

    public function getRandom()
    {
        $listQuestion = DB::table('question')
            ->select('users.full_name','users.avatar','question.*')
            ->join('users','question.id_user','=','users.id')
            ->inRandomOrder()
            ->offset(0)->limit(5)->get();

        for($i = 0;$i < count($listQuestion); $i++)
        {
            $listQuestion[$i]->time = TimeService::time_ago($listQuestion[$i]->created_at);

             $listQuestion[$i]->favorited = true;

            $liked = DB::table('vote_question')
                     ->where('id_question',$listQuestion[$i]->id)
                     ->where('id_user',auth()->user()->id)
                     ->where('type',1)->first();

            if($liked)
                $listQuestion[$i]->liked = true;
            else
                $listQuestion[$i]->liked = false;

            $disLiked = DB::table('vote_question')
                ->where('id_question',$listQuestion[$i]->id)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->first();

            if($disLiked)
                $listQuestion[$i]->disliked = true;
            else
                $listQuestion[$i]->disliked = false;

        }

        return response()->json($listQuestion,200,[],JSON_UNESCAPED_UNICODE);
    }

    //====================================================================================


    public function likeQuestion(Request $request)
    {
        $action = $request->action;

        if($action == 'like')
        {
            DB::table('vote_question')
            ->where('id_question',$request->id_question)
            ->where('id_user',auth()->user()->id)
            ->where('type',0)->delete();

            DB::table('vote_question')
            ->insert([
                'id_question' => $request->id_question,
                'id_user' => auth()->user()->id,
                'type' => 1
            ]);
        }
        else
        {
            DB::table('vote_question')
            ->where('id_question',$request->id_question)
            ->where('id_user',auth()->user()->id)
            ->where('type',1)->delete();
        }
    }

    public function dislikeQuestion(Request $request)
    {
        $action = $request->action;

        if($action == 'dislike')
        {
            DB::table('vote_question')
                ->where('id_question',$request->id_question)
                ->where('id_user',auth()->user()->id)
                ->where('type',1)->delete();

            DB::table('vote_question')
                ->insert([
                    'id_question' => $request->id_question,
                    'id_user' => auth()->user()->id,
                    'type' => 0
                ]);
        }
        else
        {
            DB::table('vote_question')
                ->where('id_question',$request->id_question)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->delete();
        }
    }

    public function favorite(Request $request)
    {
        $action = $request->action;

        if($action == 'favorite')
        {
            DB::table('favorite')
            ->insert([
                'id_question' => $request->id_question,
                'id_user' => auth()->user()->id,
            ]);
        }
        else
        {
            DB::table('favorite')
            ->where('id_question',$request->id_question)
            ->where('id_user',auth()->user()->id)
            ->delete();
        }
    }

    //=============================================================================================
}
