<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
require 'simple_html_dom.php';

class NewsController extends Controller
{
    public function getNews()
    {
        $news = DB::table('news')->select('*',DB::raw("DATE_FORMAT(created_at, '%d/%m/%Y') as time"))->paginate(20);
        return response()->json($news,200,[],JSON_UNESCAPED_UNICODE);
    }

    public function search(Request $request)
    {
        $news = DB::select(
            DB::raw("SELECT news.*,DATE_FORMAT(created_at, '%d/%m/%Y') as time FROM news WHERE MATCH(title) AGAINST('$request->key') LIMIT 20"));

        return response()->json($news,200,[],JSON_UNESCAPED_UNICODE);
    }

    public function getNewsBySlug(Request $request)
    {

        $news = DB::table('news')->select('*',DB::raw("DATE_FORMAT(created_at, '%d/%m/%Y') as time"))->where('slug',$request->slug)->first();
        if($news)
        {
            
            DB::table('news')->where('slug',$request->slug)->update([
                'view' => $news->view + 1
            ]);
            
            $html = file_get_html($news->content);
            $content = $html->find($news->post_by,0);

            echo $content;
        }
        else
        {
            return response()->json(['message'=>'404'],404,[],JSON_UNESCAPED_UNICODE);
        }
    }

    public function getSimilarNews()
    {
        $news = DB::select(DB::raw("SELECT news.*,DATE_FORMAT(created_at, '%d/%m/%Y') as time FROM news ORDER BY RAND() LIMIT 5"));
        return response()->json($news,200,[],JSON_UNESCAPED_UNICODE);
    }
}
