<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\QiNiuController;
use App\Http\Controllers\Wechat\ArticleController;
use App\Http\Controllers\Wechat\ExaminationController;
use App\Http\Controllers\Wechat\RubbishController;
use App\Http\Controllers\Wechat\UserController;

$api = app('Dingo\Api\Routing\Router');

$api->version('v1', function ($api) {

    $api->group(['prefix' => 'wechat','middleware' => 'api.throttle', 'limit' => 100, 'expires' => 1], function ($api) {

        $api->group(['prefix' => 'auth'], function ($api) {
            /** 登录 */
            $api->post('/login', LoginController::class . '@apiLogin');
        });

        $api->group([], function ($api) {

            /** 获取七牛上传token */
            $api->get('/upload_token', QiNiuController::class . '@getUploadToken');

            /** 获取用户信息 **/
            $api->get('/user',UserController::class . '@personal');

            /** 获取文章 **/
            $api->get('/articles',ArticleController::class . '@articleList');

            /** 获取文章详情 **/
            $api->get('/article/{id}',ArticleController::class . '@detail');

            /** 获取垃圾分类数据 **/
            $api->get('/rubbishs',RubbishController::class . '@getRubbish');

            /** 搜索垃圾 **/
            $api->get('/rubbish/search',RubbishController::class . '@search');

            /** 搜索垃圾 **/
            $api->post('/rubbish/image_scan',RubbishController::class . '@scan');

            /** 获取题目 **/
            $api->get('/rubbish/questions',RubbishController::class . '@getQuestions');

            /** 保存测试记录 **/
            $api->post('/rubbish/examination',ExaminationController::class . '@saveRecord');
        });

    });

});


