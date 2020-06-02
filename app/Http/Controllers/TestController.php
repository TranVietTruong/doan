<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Services\TokenizerService;
use App\Services\QuestionClassifyService;
use App\Services\CrfService;
use NlpTools\Similarity\CosineSimilarity;
use Phpml\Tokenization\WhitespaceTokenizer;


class TestController extends Controller
{

    public function test2()
    {
        $s1 = "";
        $s2 = "Hello, I love you, won't you tell me your name
        Hello, I love you, let me jump in your game";

        $tok = new WhitespaceTokenizer();

        $cos = new CosineSimilarity();

        $setA = $tok->tokenize($s1);
        $setB = $tok->tokenize($s2);

        dd($cos->similarity($setA,$setB));
    }

    public function test()
    {
//        $t = new TokenizerService();
//        $str = 'bắt đầu khởi nghiệp cần chuẩn bị những gì';
//        dd($t->Tokenizer($str));



        $q = new QuestionController();
        $q->trainQuestion();
        dd('ok');

//        $q = new QuestionClassifyService();
//        $q->insert();
//        dd('ok');
////
//        $t = new TokenizerService();
//        $str = 'Thuế nghĩa là gì';
//
//        dd($t->Tokenizer($str));

//        $q = new QuestionController();
//        $q->trainQuestion();
//        dd('ok');
//        $arr_text = [];
//        $arr_label = [];
//
//        $fn = public_path('dataset/dataset_crf.txt');
//        $fh = fopen($fn, "r");
//        while(!feof($fh))
//        {
//            $line = fgets($fh);
//            echo $line;
//            echo "<br>";
//            $arr_data = explode('|', trim($line));
//            array_push($arr_text,$arr_data[0]);
//            array_push($arr_label,$arr_data[1]);
//
//        }
//        fclose($fh);
//        dd();
//        $i = 0;
//        foreach ($arr_text as $value)
//        {
//            echo count(explode(' ',$value)).' | '.count(explode(' ',$arr_label[$i]));
//            echo "<br>";
//            $i++;
//        }
//
//        dd();

//        $s = new CrfService();
//
//
//        $str = "cần bao nhiêu tiền để có thể khởi nghiệp";
//        $result = $s->crf($str);
//        for ($i = 0;$i < count($result); $i++)
//        {
//            $tag = explode('/',$result[$i])[1];
//            if($tag == 'O')
//                array_splice($result,$i,1);
//
//        }
//        dd($result);
    }

    public function test1()
    {
//        $c = new TokenizerService();
//        $data = DB::table('dataset_answer')->get();
//        foreach ($data as $value)
//        {
//            DB::table('dataset_answer')->update([
//                'text_tokenizer' => $c->Tokenizer($value->text)
//            ]);
//        }
//        dd('ok');


        $c = new QuestionClassifyService();
//        $c->insert();
//        dd('ok');
        $b = new TokenizerService();
       // dd($b->Tokenizer('tại sao phải khởi nghiệp'));
        $str = $b->Tokenizer('tại sao phải khởi nghiệp');

        $c->getEntity($str);

       // dd($c->getEntity($str));
        dd($c->QuestionClassify($str));
    }
}
