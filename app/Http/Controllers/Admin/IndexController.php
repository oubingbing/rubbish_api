<?php


namespace App\Http\Controllers\Admin;


use App\Exceptions\WebException;
use App\Http\Controllers\Controller;
use App\Http\Service\CustomerService;
use App\Http\Service\QiNiuService;
use App\Models\CollegeArticle;
use App\Models\Customer;

class IndexController extends Controller
{
    /**
     * 进入管理后台首页
     *
     * @author yezi
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $admin = request()->get('user');

        return view('admin.index',["user"=>$admin]);
    }

    /**
     * 后台主页
     *
     * @author yezi
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function dashboard()
    {
        $user = request()->get('user');

        return view('admin.dashboard',['user'=>$user]);
    }

}