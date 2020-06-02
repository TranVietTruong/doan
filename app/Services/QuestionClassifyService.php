<?php
namespace App\Services;
use Illuminate\Support\Facades\DB;
use Phpml\Classification\MLPClassifier;
use Phpml\Classification\SVC;
use Phpml\ModelManager;
use Phpml\NeuralNetwork\ActivationFunction\PReLU;
use Phpml\NeuralNetwork\ActivationFunction\Sigmoid;
use Phpml\NeuralNetwork\Layer;
use Phpml\NeuralNetwork\Node\Neuron;
use Phpml\SupportVectorMachine\Kernel;
use Phpml\Classification\NaiveBayes;
use Phpml\FeatureExtraction\TfIdfTransformer;
use Phpml\FeatureExtraction\TokenCountVectorizer;
use Phpml\Tokenization\WhitespaceTokenizer;


class QuestionClassifyService
{
    public function QuestionClassify($str)
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
        $vectorizer->transform($samples);

        //dd($vocabulary);

        //đếm tần xuất quan trọng
        $transformer = new TfIdfTransformer($samples);
        $transformer->transform($samples);

        // phân lớp
        //$classifier = new SVC(Kernel::RBF, $cost = 1000);
        //$classifier = new NaiveBayes();
        //$classifier->train($samples, $labels);

        $filepath = public_path('dataset\model\model');

        $modelManager = new ModelManager();
        //$modelManager->saveToFile($classifier, $filepath);
        //dd('ok');
        // predict
        $data = [$str];


        $vectorizer2 = new TokenCountVectorizer(new WhitespaceTokenizer());
        $vectorizer2->fit($data);
        $vectorizer->transform($data);
        $transformer->transform($data);

        //$result = $classifier->predict($data);

        $restoredClassifier = $modelManager->restoreFromFile($filepath);
        $result = $restoredClassifier->predict($data);

        return $result[0];
    }

    public function classify_cnn($str)
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
        $vectorizer->transform($samples);

        //dd($vocabulary);

        //đếm tần xuất quan trọng
        $transformer = new TfIdfTransformer($samples);
        $transformer->transform($samples);
        //dd($samples);
        // phân lớp
//        $layer1 = new Layer(2, Neuron::class, new PReLU());
//        $layer2 = new Layer(2, Neuron::class, new Sigmoid());
//
//        $arr = ['DESC:def','DESC:manner','DESC:desc','DESC:reason','HUM:desc','NUM:money'];
//        $mlp = new MLPClassifier(4, [$layer1,$layer2],$arr);
//        $mlp->setLearningRate(0.1);
//
//        $mlp->train($samples,$labels);
//        dd('Ok');
        $filepath = public_path('dataset\model\model_cnn');

        $modelManager = new ModelManager();
//        $modelManager->saveToFile($mlp, $filepath);
//        dd('ok');
        // predict
        $data = [$str];


        $vectorizer2 = new TokenCountVectorizer(new WhitespaceTokenizer());
        $vectorizer2->fit($data);
        $vectorizer->transform($data);
        $transformer->transform($data);

        //$result = $classifier->predict($data);

        $restoredClassifier = $modelManager->restoreFromFile($filepath);
        $result = $restoredClassifier->predict($data);

        //$result = $mlp->predict($data);

        return $result[0];
    }


    public function getEntity($str)
    {
        $samples = [];
        $labels = [];

        $data = DB::table('dataset_question')->get();

        foreach ($data as $value)
        {
            array_push($labels,join('|',[$value->class,$value->relation ]));
            array_push($samples,$value->question);
        }


        //chuyển về ma trận số
        $vectorizer = new TokenCountVectorizer(new WhitespaceTokenizer());
        $vectorizer->fit($samples);
        $vocabulary  = $vectorizer->getVocabulary();
        $vectorizer->transform($samples);

        dd($vocabulary);

        //đếm tần xuất quan trọng
        $transformer = new TfIdfTransformer($samples);
        $transformer->transform($samples);


        // predict
        $data = [$str];

        $vectorizer2 = new TokenCountVectorizer(new WhitespaceTokenizer());
        $vectorizer2->fit($data);
        $vectorizer->transform($data);
        $transformer->transform($data);

        dd($data);


        $result = [];
        for($i = 0;$i <  count($data[0]); $i++)
        {
            if($data[0][$i] > 0)
            {
                array_push($result,[
                    'point' => $data[0][$i],
                    'word' => $vocabulary[$i]
                ]);
            }
        }


        //return $result;
        dd($result);
    }

    public function insert()
    {
        $samples = [];
        $labels = [];
        $fn = public_path('dataset/dataset_question.txt');
        //$fn = 'vendor/tokenizer/train_question.txt';
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            $arr_data = explode('|', trim($line));

            DB::table('dataset_question')->insert([
                'class' => $arr_data[0],
                'question' => $arr_data[1],
            ]);
            echo "ok";
        }
        fclose($fh);
    }
}