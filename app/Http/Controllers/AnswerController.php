<?php

namespace App\Http\Controllers;

use App\Services\TimeService;
use App\Services\TokenizerService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Phpml\FeatureExtraction\TokenCountVectorizer;

class AnswerController extends Controller
{
    public function postAnswer(Request $request)
    {

        $question = DB::table('question')->where('id',$request->id_question)->first();

        $tokenizer = new TokenizerService();
        $text_tokenizer = $tokenizer->Tokenizer($request->content_text);

        DB::table('dataset_answer')->insert([
            'class' => $question->class,
            'text_html' => $request->content,
            'text_tokenizer' => $text_tokenizer,
            'text' => $request->content_text,
            'feature' => $question->feature
        ]);


    	DB::table("answer")->insert([
    		'id_question' => $request->id_question,
    		'id_user'=> auth()->user()->id,
    		'content' => $request->content,
    		'content_text' => $request->content_text,
    		'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
    		'updated_at' => Carbon::now('Asia/Ho_Chi_Minh'),
    	]);



    	$id = DB::getPdo()->lastInsertId();

        $answer = DB::table('answer')
        ->select('users.full_name','users.avatar','answer.*')
        ->join('users','answer.id_user','=','users.id')
        ->where('answer.id',$id)
        ->first();

        $answer->time = TimeService::time_ago($answer->created_at);

        return response()->json($answer,200,[],JSON_UNESCAPED_UNICODE);

    }


    public function likeAnswer(Request $request)
    {
        $action = $request->action;

        if($action == 'like')
        {
            DB::table('vote_answer')
            ->where('id_answer',$request->id_answer)
            ->where('id_user',auth()->user()->id)
            ->where('type',0)->delete();

            DB::table('vote_answer')
            ->insert([
                'id_answer' => $request->id_answer,
                'id_user' => auth()->user()->id,
                'type' => 1
            ]);
        }
        else
        {
            DB::table('vote_answer')
            ->where('id_answer',$request->id_answer)
            ->where('id_user',auth()->user()->id)
            ->where('type',1)->delete();
        }
    }

    public function dislikeAnswer(Request $request)
    {
        $action = $request->action;

        if($action == 'dislike')
        {
            DB::table('vote_answer')
                ->where('id_answer',$request->id_answer)
                ->where('id_user',auth()->user()->id)
                ->where('type',1)->delete();

            DB::table('vote_answer')
                ->insert([
                    'id_answer' => $request->id_answer,
                    'id_user' => auth()->user()->id,
                    'type' => 0
                ]);
        }
        else
        {
            DB::table('vote_answer')
                ->where('id_answer',$request->id_answer)
                ->where('id_user',auth()->user()->id)
                ->where('type',0)->delete();
        }
    }



    public function insertAnswer(Request $request)
    {
        $c = new TokenizerService();
        $text_tokenizer = $c->Tokenizer($request->text);
        echo $text_tokenizer;

        DB::table('dataset_answer')->insert([
            'text_html' => $request->text_html,
            'text' => $request->text,
            'text_tokenizer' => $text_tokenizer
        ]);
    }
}
