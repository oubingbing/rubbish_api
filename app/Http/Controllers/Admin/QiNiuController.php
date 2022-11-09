<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/29 0029
 * Time: 9:29
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Http\Service\QiNiuService;

class QiNiuController extends Controller
{
    /**
     * 获取七牛token，不存在就新建
     *
     * @author yezi
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function token()
    {
        $qiNiuToken = app(QiNiuService::class)->getToken();
        return webResponse('success',$qiNiuToken);
    }

}