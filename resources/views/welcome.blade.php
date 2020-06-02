<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <base href="{{asset('')}}">
        <meta id="token" name="csrf-token" content="{{csrf_token()}}">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đồ Án Tốt Nghiệp</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="{{asset('css/app.css')}}">

        <style>
            * {
                outline: none !important;
                font-family: Whitney,Helvetica Neue,Helvetica,Arial,sans-serif !important;
            }
        
            
            a.v-btn{
                text-decoration: none !important;
            }
            .v-application a {
                color: #ffffff !important;
            }
        </style>
    </head>
    <body>

        <div id="app">
            <v-app id="inspire">
                <router-view></router-view>
            </v-app>
        </div>
        <script src="{{asset('js/app.js')}}"></script>
    </body>
</html>
