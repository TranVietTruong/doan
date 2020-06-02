<?php

namespace App\Providers;

use App\Services\TimeService;
use App\Services\TokenizerService;
use App\Services\QuestionClassifyService;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('App\Services\TimeService',function($app){
            return new TimeService();
        });

        $this->app->bind('App\Services\TokenizerService',function($app){
            return new TokenizerService();
        });

        $this->app->bind('App\Services\QuestionClassifyService',function($app){
            return new QuestionClassifyService();
        });

        $this->app->bind('App\Services\CrfService',function($app){
            return new CrfService();
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
