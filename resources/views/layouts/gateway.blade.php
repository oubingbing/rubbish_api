<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>bing_shop</title>
    <link rel="stylesheet" href="{{asset('css/font.css')}}">
    <link rel="shortcut icon" href="{{ asset('img/logo.jfif') }}" type="image/x-icon">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <style>
        .footer{
            background: #EEEEEE;
            text-align: center;
            padding: 5px;
        }
    </style>
</head>
<body>
<div id="app">

    <nav class="navbar navbar-inverse" style="background: #009688;">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/" style="color: white">bing_shop</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="{{ asset('/') }}" style="color: white">首页</a></li>
                    @if (session("customer_id"))
                        <li><a href="{{ asset('/admin') }}" style="color: white">{{session('customer_name')}}</a></li>
                        <li><a href="{{ asset('/admin') }}" style="color: white">控制台</a></li>
                        <li><a href="{{ asset('/logout') }}" style="color: white">退出</a></li>
                    @else
                        <li><a href="{{ asset('login') }}" style="color: white">登录</a></li>
                        <li><a href="{{ asset('register') }}" style="color: white">注册</a></li>
                    @endif
                    <li><a href="{{ asset('contact') }}" style="color: white">联系</a></li>
                </ul>
            </div>
        </div>
    </nav>
    @yield('content')

    <footer class="footer navbar-fixed-bottom">
        <div class="container footer">
            <a href="http://www.miitbeian.gov.cn/">@2016-2018 bing_shop | 粤ICP备16004706号-1</a>
        </div>
    </footer>
</div>

<script src="{{ asset('js/app.js') }}"></script>
</body>
</html>