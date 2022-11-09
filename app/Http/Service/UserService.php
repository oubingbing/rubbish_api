<?php
/**
 * Created by PhpStorm.
 * User: xuxiaodao
 * Date: 2017/11/5
 * Time: 下午4:43
 */

namespace App\Http\Service;


use App\Exceptions\ApiException;
use App\Models\User;

class UserService
{
    private $builder;

    /**
     * 新增用户
     *
     * @author yezi
     * @param $userInfo
     * @return mixed
     */
    public function createWeChatUser($userInfo)
    {
        $result = User::create([
            User::FIELD_ID_OPENID => $userInfo["openId"],
            User::FIELD_NICKNAME  => $userInfo['nickName'],
            User::FIELD_GENDER    => $userInfo['gender'] ? $userInfo['gender'] : 0,
            User::FIELD_AVATAR    => $userInfo['avatarUrl'],
            User::FIELD_CITY      => $userInfo['city'] ? $userInfo['city'] : '无',
            User::FIELD_COUNTRY   => $userInfo['country'] ? $userInfo['country'] : '无',
            User::FIELD_PROVINCE  => $userInfo['province'] ? $userInfo['province'] : '无',
            User::FIELD_LANGUAGE  => $userInfo['language'],
            User::FIELD_STATUS    => User::ENUM_STATUS_ACTIVITY
        ]);

        return $result;
    }

    /**
     * 新建查询构造器
     *
     * @author yezi
     *
     * @return $this
     */
    public function queryBuilder()
    {
        $builder        = User::query();
        $this->builder = $builder;
        return $this;
    }

    public function filter($username)
    {
        if($username){
            $this->builder->where(User::FIELD_NICKNAME,'like',"%$username%");
        }
        return $this;
    }

    /**
     * 排序
     *
     * @author yezi
     *
     * @param $orderBy
     * @return $this
     */
    public function sort($orderBy,$sortBy)
    {
        $this->builder->orderBy($orderBy,$sortBy);

        return $this;
    }

    /**
     * 返回查询构造器
     *
     * @author yezi
     *
     * @return mixed
     */
    public function done()
    {
        return $this->builder;
    }

    /**
     * 获取用户资料
     *
     * @author yezi
     *
     * @param $id
     * @return mixed
     */
    public function getUserById($id)
    {
        $user = User::find($id);

        return $user;
    }

    /**
     * 验证参数
     *
     * @author yezi
     *
     * @param $request
     * @return array
     */
    public function validProfile($request)
    {
        $rules = [
            'username'       => 'required',
            'student_number' => 'required',
            'grade'          => 'required',
            'major'          => 'required',
            'college'        => 'required',
            'mobile'         => 'required',
            'code'           => 'required | numeric',
        ];
        $message = [
            'username.required'       => '名字不能为空！',
            'student_number.required' => '学号不能为空！',
            'grade.numeric'           => '年级不能为空！',
            'major.required'          => '专业不能为空！',
            'college.required'        => '学院不能为空！',
            'mobile.numeric'          => '手机不能为空！',
            'code.required'           => '验证码不能为空！',
            'code.numeric'            => '验证码必须是数字！'
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
     * 废弃
     *
     * @param $id
     * @return \Illuminate\Database\Eloquent\Model|null|object|static
     */
    public function getPhoneById($id)
    {
        return User::query()->where(User::FIELD_ID,$id)->first();
    }

    /**
     * 不用
     *
     * @param $userId
     * @param $phone
     * @return bool
     * @throws ApiException
     */
    public function bindUser($userId,$phone)
    {
        $user = $this->getPhoneById($userId);
        if(!$user){
            throw new ApiException("用户不存在");
        }

        if($user->{User::FIELD_PHONE}){
            throw new ApiException("用户已绑定");
        }

        $user->{User::FIELD_PHONE} = $phone;
        $result = $user->save();
        if(!$result){
            throw new ApiException("更新数据失败");
        }

        return $result;
    }
}