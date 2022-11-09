<?php

namespace App\Http\Controllers\Wechat;


use App\Exceptions\ApiException;
use App\Http\Controllers\Controller;
use App\Http\Service\UserService;
use App\Http\Service\YunPianService;
use App\Models\User;

class UserController extends Controller
{
    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * 获取用户信息
     *
     * @author yezi
     *
     * @return array|string
     */
    public function user($id)
    {
        $user = User::find($id);

        return $user;
    }

    /**
     * 获取个人信息
     *
     * @author yezi
     *
     * @return array|string
     */
    public function personal()
    {
        $user = request()->input('user');

        return $user;
    }

    /**
     * 发送短信验证码
     *
     * @author yezi
     * @return mixed
     * @throws ApiException
     */
    public function sendMessage()
    {
        $user  = request()->input('user');
        $phone = request()->input("phone");

        if(empty($phone)){
            throw new ApiException("手机号码不能为空");
        }

        $validPhone = validMobile($phone);
        if(!$validPhone){
            throw new ApiException("手机号码格式不正确");
        }

        $result = app(YunPianService::class)->sendMessageCode($phone);
        if($result['code'] != 0){
            throw new ApiException('发送失败！',500);
        }

        return $result;
    }
}