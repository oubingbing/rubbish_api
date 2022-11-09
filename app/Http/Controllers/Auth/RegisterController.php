<?php

namespace App\Http\Controllers\Auth;

use App\Exceptions\WebException;
use App\Http\Controllers\Controller;
use App\Http\Service\AuthService;
use App\Http\Service\CustomerService;
use App\Http\Service\YunPianService;
use App\Models\Customer;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    private $authService;

    public function __construct(AuthService $authService)
    {
        $this->authService = $authService;
    }

    /**
     * 注册视图
     *
     * @author yezi
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function registerView()
    {
        return view('auth.register');
    }

    /**
     * 注册
     *
     * @author yezi
     * @param Request $request
     * @return mixed
     * @throws WebException
     */
    public function register(Request $request)
    {
        $nickname = request()->input("nickname");
        $email    = request()->input("email");
        $password = request()->input("password");

        $valid = $this->authService->validRegister($request);
        if(!$valid['valid']){
            throw new WebException($valid['message']);
        }

        try{
            \DB::beginTransaction();

            $result = $this->authService->createAdmin($nickname,$email,$password);

            \DB::commit();
        }catch (\Exception $exception){
            \DB::rollBack();
            throw new WebException($exception);
        }

        return ["message"=>'添加成功'];
    }
}
