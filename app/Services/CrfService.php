<?php
namespace App\Services;


use Phpml\Classification\MLPClassifier;
use Phpml\Classification\SVC;
use Phpml\FeatureExtraction\TfIdfTransformer;
use Phpml\FeatureExtraction\TokenCountVectorizer;
use Phpml\ModelManager;
use Phpml\NeuralNetwork\ActivationFunction\PReLU;
use Phpml\NeuralNetwork\ActivationFunction\Sigmoid;
use Phpml\NeuralNetwork\Layer;
use Phpml\NeuralNetwork\Node\Neuron;
use Phpml\SupportVectorMachine\Kernel;
use Phpml\Tokenization\WhitespaceTokenizer;

class CrfService
{

    public function crf($str)
    {
//        set_time_limit(800);
//        $arr_text = [];
//        $arr_label = [];
//
//        $fn = public_path('dataset/dataset_crf.txt');
//        $fh = fopen($fn, "r");
//        while(!feof($fh))
//        {
//            $line = fgets($fh);
//            $arr_data = explode('|', trim($line));
//            array_push($arr_text,$arr_data[0]);
//            array_push($arr_label,$arr_data[1]);
//
//        }
//        fclose($fh);
//
//       // dd($arr_label);
//
//        $labels = [];
//        $samples = [];
//        for ($i = 0;$i < count($arr_text);$i++)
//        {
//            $arr_word = explode(' ',$arr_text[$i]);
//            $arr_lb = explode(' ',$arr_label[$i]);
//
//
//
//            for ($j = 0;$j < count($arr_word);$j++)
//            {
//                $str1 = '';
//                $str2 = '';
//                $str3 = '';
//                $str4 = '';
//                $str5 = '';
//                $str6 = '';
//                $str7 = '';
//                $str8 = '';
//
//                if(isset($arr_word[$j-2]))
//                    $str1 = $arr_word[$j-2];
//
//                if(isset($arr_word[$j-1]))
//                    $str2 = $arr_word[$j-1];
//
//                if(isset($arr_word[$j+1]))
//                    $str3 = $arr_word[$j+1];
//
//                if(isset($arr_word[$j+2]))
//                    $str4 = $arr_word[$j+2];
//
//                if(isset($arr_word[$j-1]))
//                    $str5 = join(' ',[$arr_word[$j-1],$arr_word[$j]]);
//
//                if(isset($arr_word[$j+1]))
//                    $str6 = join(' ',[$arr_word[$j],$arr_word[$j+1]]);
//
//                if(isset($arr_word[$j-1]) && isset($arr_word[$j+1]))
//                    $str7 = join(' ',[$arr_word[$j-1],$arr_word[$j+1]]);
//
//                if(isset($arr_word[$j-1]) && isset($arr_word[$j+1]))
//                    $str8 = join(' ',[$arr_word[$j-1],$arr_word[$j],$arr_word[$j+1]]);
//
//
//
//
//                $v1 = $this->feature_Volcabury($j,$str1);
//                $v2 = $this->feature_Volcabury($j,$str2);
//                $v3 = $this->feature_Volcabury($j,$str3);
//                $v4 = $this->feature_Volcabury($j,$str4);
//                $v5 = $this->feature_Volcabury($j,$str5);
//                $v6 = $this->feature_Volcabury($j,$str6);
//                $v7 = $this->feature_Volcabury($j,$str7);
//                $v8 = $this->feature_Volcabury($j,$str8);
//
//                $v9 = $this->feature($arr_word,$j);
//
//                $vector_main = array_merge($v1,$v2,$v3,$v4,$v5,$v6,$v7,$v8,$v9);
//
//
//                array_push($samples,$vector_main);
//
//                array_push($labels,$arr_lb[$j]);
//            }
//        }


//        $classifier = new SVC(Kernel::RBF, $cost = 1000);
//        $classifier->train($samples, $labels);
//        $layer1 = new Layer(2, Neuron::class, new PReLU());
//        $layer2 = new Layer(2, Neuron::class, new Sigmoid());
//
//        $mlp = new MLPClassifier(4, [$layer1,$layer2],array_unique($labels));
//        $mlp->setLearningRate(0.1);
//        $mlp->train($samples,$labels);
        $filepath = public_path('dataset\model\model_crf');
        $modelManager = new ModelManager();
//        $modelManager->saveToFile($mlp, $filepath);
//        dd('train success');


        $arr_data = explode(' ',$str);
        $result = [];
        for($i = 0;$i < count($arr_data); $i++)
        {

            $str1 = '';
            $str2 = '';
            $str3 = '';
            $str4 = '';
            $str5 = '';
            $str6 = '';
            $str7 = '';
            $str8 = '';

            if(isset($arr_data[$i-2]))
                $str1 = $arr_data[$i-2];

            if(isset($arr_data[$i-1]))
                $str2 = $arr_data[$i-1];

            if(isset($arr_data[$i+1]))
                $str3 = $arr_data[$i+1];

            if(isset($arr_data[$i+2]))
                $str4 = $arr_data[$i+2];

            if(isset($arr_data[$i-1]))
                $str5 = join(' ',[$arr_data[$i-1],$arr_data[$i]]);

            if(isset($arr_data[$i+1]))
                $str6 = join(' ',[$arr_data[$i],$arr_data[$i+1]]);

            if(isset($arr_data[$i-1]) && isset($arr_data[$i+1]))
                $str7 = join(' ',[$arr_data[$i-1],$arr_data[$i+1]]);

            if(isset($arr_data[$i-1]) && isset($arr_data[$i+1]))
                $str8 = join(' ',[$arr_data[$i-1],$arr_data[$i],$arr_data[$i+1]]);




            $v1 = $this->feature_Volcabury($i,$str1);
            $v2 = $this->feature_Volcabury($i,$str2);
            $v3 = $this->feature_Volcabury($i,$str3);
            $v4 = $this->feature_Volcabury($i,$str4);
            $v5 = $this->feature_Volcabury($i,$str5);
            $v6 = $this->feature_Volcabury($i,$str6);
            $v7 = $this->feature_Volcabury($i,$str7);
            $v8 = $this->feature_Volcabury($i,$str8);

            $v9 = $this->feature($arr_data,$i);

            $data = array_merge($v1,$v2,$v3,$v4,$v5,$v6,$v7,$v8,$v9);

            //$tag = $classifier->predict($data);

            $restoredClassifier = $modelManager->restoreFromFile($filepath);
            $tag = $restoredClassifier->predict($data);

            $ketqua = $arr_data[$i].'/'.$tag;
            array_push($result,$ketqua);
        }
        dd($result);
        $i =0;

        foreach ($result as $value)
        {
            $s = explode('/',$value);
            if($s[1] == 'O')
                array_splice($result,$i,1);
            $i++;
        }


        $s = join(' ',$result);
        $s = str_replace('/B_HIG','',$s);
        $s = str_replace('/I_HIG','',$s);
        return $s;
        //return $result;
    }

    public function train()
    {
        set_time_limit(800);
        $arr_text = [];
        $arr_label = [];

        $fn = public_path('dataset/dataset_crf.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            $arr_data = explode('|', trim($line));
            array_push($arr_text,$arr_data[0]);
            array_push($arr_label,$arr_data[1]);

        }
        fclose($fh);

        // dd($arr_label);

        $labels = [];
        $samples = [];
        for ($i = 0;$i < count($arr_text);$i++)
        {
            $arr_word = explode(' ',$arr_text[$i]);
            $arr_lb = explode(' ',$arr_label[$i]);



            for ($j = 0;$j < count($arr_word);$j++)
            {
                $str1 = '';
                $str2 = '';
                $str3 = '';
                $str4 = '';
                $str5 = '';
                $str6 = '';
                $str7 = '';
                $str8 = '';

                if(isset($arr_word[$j-2]))
                    $str1 = $arr_word[$j-2];

                if(isset($arr_word[$j-1]))
                    $str2 = $arr_word[$j-1];

                if(isset($arr_word[$j+1]))
                    $str3 = $arr_word[$j+1];

                if(isset($arr_word[$j+2]))
                    $str4 = $arr_word[$j+2];

                if(isset($arr_word[$j-1]))
                    $str5 = join(' ',[$arr_word[$j-1],$arr_word[$j]]);

                if(isset($arr_word[$j+1]))
                    $str6 = join(' ',[$arr_word[$j],$arr_word[$j+1]]);

                if(isset($arr_word[$j-1]) && isset($arr_word[$j+1]))
                    $str7 = join(' ',[$arr_word[$j-1],$arr_word[$j+1]]);

                if(isset($arr_word[$j-1]) && isset($arr_word[$j+1]))
                    $str8 = join(' ',[$arr_word[$j-1],$arr_word[$j],$arr_word[$j+1]]);




                $v1 = $this->feature_Volcabury($j,$str1);
                $v2 = $this->feature_Volcabury($j,$str2);
                $v3 = $this->feature_Volcabury($j,$str3);
                $v4 = $this->feature_Volcabury($j,$str4);
                $v5 = $this->feature_Volcabury($j,$str5);
                $v6 = $this->feature_Volcabury($j,$str6);
                $v7 = $this->feature_Volcabury($j,$str7);
                $v8 = $this->feature_Volcabury($j,$str8);

                $v9 = $this->feature($arr_word,$j);

                $vector_main = array_merge($v1,$v2,$v3,$v4,$v5,$v6,$v7,$v8,$v9);


                array_push($samples,$vector_main);

                array_push($labels,$arr_lb[$j]);
            }
        }

        $layer1 = new Layer(2, Neuron::class, new PReLU());
        $layer2 = new Layer(2, Neuron::class, new Sigmoid());
        $layer3 = new Layer(2, Neuron::class, new PReLU());
        $layer4 = new Layer(2, Neuron::class, new Sigmoid());

      //  dd(array_unique($labels));

        $mlp = new MLPClassifier(4, [$layer1,$layer2,$layer3,$layer4],['B_HIG','I_HIG','O']);
        $mlp->setLearningRate(0.1);
        $mlp->train($samples,$labels);
        $filepath = public_path('dataset\model\model_crf2');
        $modelManager = new ModelManager();
        $modelManager->saveToFile($mlp, $filepath);
        dd('train success');
    }


    public function feature($arr_word,$index)
    {
        $samples = [];

        $this->firs_Volcabury($index) ? array_push($samples,1):array_push($samples,0);
        $this->is_Title($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_Uppercase($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_Lowercase($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_Number($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_YearMonthDay($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_MonthDay($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_Year($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_Percent($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_TuLayToanBo($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->is_TuLayBoPhan($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->coTrongTuDien($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->coTrongHo($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);
        $this->coTrongTen($arr_word[$index]) ? array_push($samples,1):array_push($samples,0);

        return $samples;
    }

   public function feature_Volcabury($index,$str)
   {
        $vector = [];
        if($str != '')
        {
            $this->firs_Volcabury($index) ? array_push($vector,1):array_push($vector,0);
            $this->is_Title($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_Uppercase($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_Lowercase($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_Number($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_YearMonthDay($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_MonthDay($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_Year($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_Percent($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_TuLayToanBo($str) ? array_push($vector,1):array_push($vector,0);
            $this->is_TuLayBoPhan($str) ? array_push($vector,1):array_push($vector,0);
            $this->coTrongTuDien($str) ? array_push($vector,1):array_push($vector,0);
            $this->coTrongHo($str) ? array_push($vector,1):array_push($vector,0);
            $this->coTrongTen($str) ? array_push($vector,1):array_push($vector,0);
        }
        else
        {
            $vector = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        }
        return $vector;
   }

   public function firs_Volcabury($index)
   {
        if($index == 0)
            return 1;
        return 0;
   }

   public function is_Uppercase($str)
   {
       $pattern = '/^[A-Z]*$/';
       if (preg_match($pattern, $str))
            return 1;
       return 0;
   }

   public function is_Lowercase($str)
   {
       $pattern = '/^[a-z]*$/';
       if (preg_match($pattern, $str))
           return 1;
       return 0;
   }

    public function is_Number($str)
    {
        $pattern = '/^[0-9]*$/';
        if (preg_match($pattern, $str))
            return 1;
        return 0;
    }

    public function is_YearMonthDay($str)
    {
        $pattern = '/^[0-9]+\/[0-9]+\/[0-9]+$/';
        if (preg_match($pattern, $str))
            return 1;
        return 0;
    }

    public function is_MonthDay($str)
    {
        $pattern = '/^[0-9]+\/[0-9]+$/';
        if (preg_match($pattern, $str))
            return 1;
        return 0;
    }

    public function is_Year($str)
    {
        $pattern = '/^[0-9][0-9][0-9][0-9]$/';
        if (preg_match($pattern, $str))
            return 1;
        return 0;
    }

    public function is_Percent($str)
    {
        $pattern = '/^[0-9]%$/';
        if (preg_match($pattern, $str))
            return 1;
        return 0;
    }

    public function is_Title($str)
    {
        $char = substr($str,0,1);
        return $this->is_Uppercase($char);
    }

    public function is_TuLayToanBo($str)
    {
        $arr = explode(' ',$str);
        if(count($arr) <= 1)
            return 0;
        if(count($arr) > 2)
            return 0;

        if($arr[0] == $arr[1])
            return 1;
        return 0;
    }

    public function is_TuLayBoPhan($str)
    {
        $arr = explode(' ',$str);

        $num = count($arr);
        if($num != 2)
            return 0;

        similar_text($arr[0],$arr[1],$perccent);

        if($perccent > 50)
            return 1;
        return 0;

    }

    public function coTrongTuDien($str)
    {
        $dic = [];
        $fn = public_path('dataset/dataset_dictionary.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            array_push($dic,trim($line));
        }
        fclose($fh);

        $str = mb_strtolower($str);
        foreach ($dic as $word)
        {
            if($str == $word)
                return 1;
        }
        return 0;
    }


    public function coTrongHo($str)
    {
        $dic = [];
        $fn = public_path('dataset/dataset_firstname.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            array_push($dic,trim($line));
        }
        fclose($fh);

        $str = mb_strtolower($str);
        foreach ($dic as $word)
        {
            if($str == $word)
                return 1;
        }
        return 0;
    }

    public function coTrongTen($str)
    {
        $dic = [];
        $fn = public_path('dataset/dataset_lastname.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            array_push($dic,trim($line));
        }
        fclose($fh);

        $str = mb_strtolower($str);
        foreach ($dic as $word)
        {
            if($str == $word)
                return 1;
        }
        return 0;
    }


}