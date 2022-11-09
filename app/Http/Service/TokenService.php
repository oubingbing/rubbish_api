<?php

namespace App\Http\Service;

use App\Exceptions\ApiException;
use App\Models\User;
use GuzzleHttp\Client;
use Tymon\JWTAuth\Facades\JWTAuth;

class TokenService
{
    /**
     * 获取微信小程序用户登录token
     *
     * @author yezi
     *
     * @param $user
     * @return mixed
     */
    public function getWecChatToken($user)
    {
        $token = JWTAuth::fromUser($user);

        return $token;
    }

    /**
     * 获取token
     *
     * @author yezi
     *
     * @return mixed
     * @throws Exception
     */
    public function createToken($userInfo)
    {
        $user = User::where(User::FIELD_ID_OPENID,$userInfo["openId"])->first();
        if(!$user){
            $userLogin = new UserService();
            $user = $userLogin->createWeChatUser($userInfo);
        }else{
            $user->{User::FIELD_NICKNAME} = $userInfo['nickName'];
            $user->{User::FIELD_AVATAR}   = $userInfo['avatarUrl'];
            $user->save();
        }

        $token = $this->getWecChatToken($user);

        return $token;
    }

    /**
     * 请求微信服务器获取access token
     *
     * @author yezi
     *
     * @param $appId
     * @return mixed
     * @throws ApiException
     */
    public function accessToken($appId)
    {
        $weChatAppId = env("WE_CHAT_APP_ID");
        $secret      = env("WE_CHAT_SECRET");
        $url         = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$weChatAppId&secret=$secret";
        $http        = new Client;
        $response    = $http->get($url);
        $result      = json_decode((string) $response->getBody(), true);

        return $result;
    }
}