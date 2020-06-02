<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TagsController extends Controller
{
    public function getAll()
    {
        $tags = DB::table('tag')->limit(30)->get();
        return response()->json($tags,200,[],JSON_UNESCAPED_UNICODE);

    }
}
