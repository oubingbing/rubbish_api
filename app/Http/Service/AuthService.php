<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/10 0010
 * Time: 15:49
 */

namespace App\Http\Service;

use App\Exceptions\WebException;
use App\Models\AdminModel as Model;

class AuthService
{
    /**
     * 校验输入信息
     *
     * @author yeiz
     *
     * @param $request
     * @return array
     */
    public function validRegister($request)
    {
        $rules = [
            'nickname'              => 'required | between:2,16 | unique:admins,nickname',
            'email'                 => 'required | unique:admins,email',
            'password'              => 'required | between:6,16',
            'password_confirmation' => 'required',
        ];
        $message = [
            'nickname.required'              => '昵称不能为空',
            'nickname.between'               => '昵称必须是2~16个字符',
            'nickname.unique'                => '昵称已存在',
            'email.required'                 => '邮箱不能为空',
            'email.unique'                   => '邮箱已存在',
            'password.required'              => '密码不能为空',
            'password.between'               => '密码必须是6~16个字符',
            'password_confirmation.required' => '确认密码不能为空',
        ];
        $validator = \Validator::make($request->all(),$rules,$message);

        if ($validator->fails()) {
            $errors = $validator->errors();
            return ['valid'=>false,'message'=>$errors->first()];
        }else{
            return ['valid'=>true,'message'=>'success'];
        }
    }

    /**
     * 保存用户信息
     *
     * @author yezi
     * @param $nickname
     * @param $phone
     * @param $password
     * @return mixed
     */
    public function createAdmin($nickname,$email,$password)
    {
        $salt          = randomKeys(8);
        $rememberToken = randomKeys(64);

        $result = Model::create([
            Model::FIELD_NICKNAME=>$nickname,
            Model::FIELD_PASSWORD=>$this->encrypt($password,$salt),
            Model::FIELD_EMAIL=>$email,
            Model::FIELD_SALT=>$salt,
            Model::FIELD_REMEMBER_TOKEN=>$rememberToken
        ]);

        return $result;
    }

    /**
     * 加密
     *
     * @author yezi
     * @param $password
     * @param $salt
     * @return string
     */
    public function encrypt($password,$salt)
    {
        return md5(md5($password.$salt).$salt);
    }

    /**
     * 根据邮箱获取用户
     *
     * @author yezi
     * @param $email
     * @return \Illuminate\Database\Eloquent\Model|null|object|static
     */
    public function getAdminByEmail($email)
    {
        $result = Model::query()->where(Model::FIELD_EMAIL,$email)->first();
        return $result;
    }

    /**
     * 登录验证
     *
     * @author yezi
     * @param $email
     * @param $password
     * @return bool
     * @throws WebException
     */
    public function attempt($email,$password)
    {
        $admin = $this->getAdminByEmail($email);
        if(!$admin){
            throw new WebException("用户不存在");
        }

        if($this->encrypt($password,$admin->{Model::FIELD_SALT}) != $admin->{Model::FIELD_PASSWORD}){
            return false;
        }else{
            session(['admin_id' => $admin->id,'email'=>$admin->{Model::FIELD_EMAIL}]);
        }

        return true;
    }

    /**
     * 判断用户是否登录
     *
     * @author yezi
     * @return bool
     */
    public function auth()
    {
        if(session()->has("admin_id")){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 获取认证用户
     *
     * @author yezi
     * @return \Illuminate\Session\SessionManager|\Illuminate\Session\Store|mixed
     */
    public function authUser()
    {
        return session("admin_id");
    }

    /**
     * 退出登录
     *
     * @author yezi
     */
    public function clearAdmin()
    {
        session()->forget('admin_id');
    }

    /**
     * 微信用户登录
     *
     * @author yezi
     * @param $unionId
     */
    public static function weChatAttempt($unionId)
    {
        session(['union_id'=>$unionId]);
    }

    /**
     * 获取微信用户信息
     *
     * @author yezi
     * @return \Illuminate\Session\SessionManager|\Illuminate\Session\Store|mixed
     */
    public static function weChatAuthUser()
    {
        return session('union_id');
    }

}