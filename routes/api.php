<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//===================== AUTH ==========================

Route::group([
   'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('register', 'AuthController@register');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});

//====================== END AUTH =======================


//===================== TAGS =========================
Route::group([
    'middleware' => 'api',
    'prefix' => 'tags'
], function ($router) {

    Route::post('getAll', 'TagsController@getAll');

});

//===================== END TAGS =========================


//===================== QUESTION =========================
Route::group([
    'middleware' => 'api',
    'prefix' => 'question'
], function ($router) {

    Route::post('postQuestion', 'QuestionController@postQuestion');
    Route::post('getQuestion', 'QuestionController@getQuestion');
    Route::post('getQuestionNotAnswer', 'QuestionController@getNotAnswer');
    Route::post('getQuestionHasAnswer', 'QuestionController@getHasAnswer');
    Route::post('getFavorite', 'QuestionController@getFavorite');
    Route::post('getHighLight', 'QuestionController@getHighLight');
    Route::post('getVote', 'QuestionController@getVote');
    Route::post('getInDay', 'QuestionController@inDay');
    Route::post('getInWeek', 'QuestionController@inWeek');
    Route::post('getInMonth', 'QuestionController@inMonth');
    Route::post('getRandom', 'QuestionController@getRandom');
    Route::post('getQuestionBySlug', 'QuestionController@getQuestionBySlug');
    Route::post('search', 'QuestionController@Search');


    Route::post('likeQuestion', 'QuestionController@likeQuestion');
    Route::post('dislikeQuestion', 'QuestionController@dislikeQuestion');
    Route::post('favorite', 'QuestionController@favorite');


    Route::post('trainQuestion', 'QuestionController@trainQuestion');

});

//===================== END QUESTION =========================


//===================== ANSWER =========================
Route::group([
    'middleware' => 'api',
    'prefix' => 'answer'
], function ($router) {

    Route::post('postAnswer', 'AnswerController@postAnswer');
    Route::post('likeAnswer', 'AnswerController@likeAnswer');
    Route::post('dislikeAnswer', 'AnswerController@dislikeAnswer');
    Route::post('insertAnswer', 'AnswerController@insertAnswer');

});

//===================== END TAGS =========================



//===================== NEWS =========================
Route::group([
    'middleware' => 'api',
    'prefix' => 'news'
], function ($router) {

    Route::post('getNews', 'NewsController@getNews');
    Route::post('getNewsBySlug','NewsController@getNewsBySlug');
    Route::post('search', 'NewsController@search');
    Route::post('getSimilarNews', 'NewsController@getSimilarNews');
});

//===================== END NEWS =========================

//===================== QA =========================
Route::group([
    'middleware' => 'api',
    'prefix' => 'qa'
], function ($router) {
    Route::post('askQuestion', 'QAController@QAAnswer');
});

//===================== END QA =========================