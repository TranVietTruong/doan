<?php
namespace App\Services;


class TokenizerService
{
    public function Tokenizer($str)
    {
        $string = preg_replace('/[\s]+/mu',' ', $str);
        $string = preg_replace('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|\;\:\"\<\>\,\.\?\\\]/', '', $string);
        $string = mb_strtolower($string,'UTF-8');
        $str = trim($string);

        $arr_str = explode(' ',$str);
        $list_word = [];
        $done = false;

        $dataset_dictionary = [];

        $fn = public_path('dataset/dataset_dictionary.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            array_push($dataset_dictionary,trim($line));
        }
        fclose($fh);


        while(count($arr_str) > 0)
        {
            $data = $arr_str;
            while ($done == false)
            {
                $word = join(' ',$data);
                if(count($data) == 1)
                {
                    array_push($list_word,$word);
                    $done = true;
                }
                else
                {
                    if(count($data) < 3)
                    {
                        for($i = 0;$i<count($dataset_dictionary) ;$i++)
                        {
                            if(trim($word) == $dataset_dictionary[$i])
                            {
                                array_push($list_word,$word);
                                $done = true;
                                break;
                            }
                        }
                    }
                    if($done == false)
                        array_pop($data);
                }
            }
            $done = false;
            $len = count($data);
            for($i = 0;$i < $len; $i++)
                array_shift($arr_str);
        }

        $result = [];
       // $i = 0;
        foreach ($list_word as $word)
        {
            array_push($result,join('_',explode(' ',$word)));
        }


        return join(' ',$result);

    }

    public function stopWord($str)
    {
        $string = preg_replace('/[\s]+/mu',' ', $str);
        $string = preg_replace('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|\;\:\"\<\>\,\.\?\\\]/', '', $string);
        $string = mb_strtolower($string,'UTF-8');
        $str = trim($string);

        $arr_str = explode(' ',$str);
        $list_word = [];
        $done = false;

        $dataset_dictionary = [];

        $fn = public_path('dataset/dataset_dictionary.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            array_push($dataset_dictionary,trim($line));
        }
        fclose($fh);


        while(count($arr_str) > 0)
        {
            $data = $arr_str;
            while ($done == false)
            {
                $word = join(' ',$data);
                if(count($data) == 1)
                {
                    array_push($list_word,$word);
                    $done = true;
                }
                else
                {
                    if(count($data) < 3)
                    {
                        for($i = 0;$i<count($dataset_dictionary) ;$i++)
                        {
                            if(trim($word) == $dataset_dictionary[$i])
                            {
                                array_push($list_word,$word);
                                $done = true;
                                break;
                            }
                        }
                    }
                    if($done == false)
                        array_pop($data);
                }
            }
            $done = false;
            $len = count($data);
            for($i = 0;$i < $len; $i++)
                array_shift($arr_str);
        }

        $stop_words = [];
        $fn = public_path('dataset/vietnamese-stopwords.txt');
        $fh = fopen($fn, "r");
        while(!feof($fh))
        {
            $line = fgets($fh);
            array_push($stop_words,trim($line));
        }
        fclose($fh);


        $i = 0;
        foreach ($list_word as $value) {
            for($j = 0;$j < count($stop_words); $j++)
            {
                if(trim($value) == $stop_words[$j])
                {
                    unset($list_word[$i]);
                    break;
                }
            }
            $i++;
        }

        $result = [];
        // $i = 0;
        foreach ($list_word as $word)
        {
            array_push($result,join('_',explode(' ',$word)));
        }


        return join(' ',$result);
    }
}