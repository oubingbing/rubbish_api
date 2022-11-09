<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2018/5/26
 * Time: 18:32
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Http\Service\UserService;
use App\Models\User;

class UserController extends Controller
{
    private $userService;

    public function __construct(UserService $service)
    {
        $this->userService = $service;
    }

    /**
     * 用户视图
     *
     * @author yezi
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        return view('admin.user');
    }

    /**
     * 获取用户列表
     *
     * @author yezi
     *
     * @return Response
     */
    public function userList()
    {
        $user       = request()->input('user');
        $pageSize   = request()->input('page_size', 20);
        $pageNumber = request()->input('page_number', 1);
        $orderBy    = request()->input('order_by', 'created_at');
        $sortBy     = request()->input('sort_by', 'desc');
        $filter     = request()->input('filter');
        $username   = request()->input("username",'');

        $pageParams = ['page_size' => $pageSize, 'page_number' => $pageNumber];
        $query = $this->userService->queryBuilder()->filter($username)->sort($orderBy, $sortBy)->done();

        $userList = paginate($query, $pageParams, '*', function ($item) use ($user) {
            $item['gender'] = collect([
                User::ENUM_GENDER_BOY=>'男',
                User::ENUM_GENDER_GIRL=>'女',
                User::ENUM_GENDER_UN_KNOW=>'未知生物',
            ])->get((string)$item[User::FIELD_GENDER],'未知生物');
            $item = collect($item)->forget([
                User::FIELD_ID_UNION,
                User::FIELD_ID_OPENID
            ]);
            return $item;
        });

        return webResponse($userList);
    }

}