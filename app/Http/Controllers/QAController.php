<?php

namespace App\Http\Controllers;

use App\Services\CrfService;
use Illuminate\Http\Request;

use App\Services\TokenizerService;
use App\Services\QuestionClassifyService;
use Illuminate\Support\Facades\DB;
use NlpTools\Similarity\CosineSimilarity;
use NlpTools\Tokenizers\WhitespaceTokenizer;


class QAController extends Controller
{
    public function QAAnswer(Request $request)
    {
        $tokenizer = new TokenizerService();
        $questionClassify = new QuestionClassifyService();

        $question = $request->question;
        $question_tokenizer = $tokenizer->Tokenizer($question);

        //dd($question_tokenizer);

        DB::table('question_user')->insert([
            'id_user' => auth()->user()->id,
            'question' => $question,
            'question_tokenizer' => $question_tokenizer
        ]);


        $class = $questionClassify->QuestionClassify($question_tokenizer);
        //$class = $questionClassify->classify_cnn($question_tokenizer);

        //dd($class);

        $listAnswer = DB::table('dataset_answer')->where('class',$class)->get();

        $i = 0;
        $crf = new CrfService();
        $cosine  = new CosineSimilarity();
        $white_space = new WhitespaceTokenizer();

        //$str1 = $crf->crf($question);
        $str1 = $tokenizer->stopWord($question);

        //dd($class);
        //dd($str1);

        $arr_question = explode(' ',$str1);

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


        $str1 = join(' ',$arr_question);
        //dd($class);

        if($str1 == '')
            return response()->json(['answer'=>'Chưa có câu trả lời'],200,[],JSON_UNESCAPED_UNICODE);

        $i = 0;

        $arr_score = [];
        foreach ($listAnswer as $answer)
        {
            $str2 = $answer->feature;

            $setA =  $white_space->tokenize($str1);
            $setB =  $white_space->tokenize($str2);

            $score = $cosine->similarity($setA,$setB);

            $listAnswer[$i]->score = $score;
            array_push($arr_score,$score);
            $i++;
        }

        $max_score = max($arr_score);

       // dd($max_score);

        if($max_score < 0.6)
            $result = 'Chưa có câu trả lời';
        else
        {
            foreach ($listAnswer as $answer)
            {
                if($answer->score == $max_score)
                    $result = $answer->text_html;
            }
        }

        return response()->json(['answer'=>$result],200,[],JSON_UNESCAPED_UNICODE);
    }
}
