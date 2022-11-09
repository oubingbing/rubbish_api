<?php

namespace App\Http\Controllers\Auth;

use App\Enum\ArticleEnum;
use App\Exceptions\ApiException;
use App\Exceptions\WebException;
use App\Http\Controllers\Controller;
use App\Http\Service\ArticleService;
use App\Http\Service\AuthService;
use App\Http\Service\FangZhouService;
use App\Http\Service\Http;
use App\Http\Service\LongZuService;
use App\Http\Service\MonsterService;
use App\Http\Service\RubbishService;
use App\Http\Service\SpiderService;
use App\Http\Service\SpriteService;
use App\Http\Service\TokenService;
use App\Http\Service\WeChatService;
use App\Models\Article;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use phpspider\core\phpspider;
use phpspider\core\requests;
use Symfony\Component\DomCrawler\Crawler;
use XCrawler\XCrawler;

class LoginController extends Controller
{

    protected $tokenService;
    private $authService;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(AuthService $authService,TokenService $tokenService)
    {
        $this->tokenService = $tokenService;
        $this->authService = $authService;
    }

    /**
     * 登录
     *
     * @author yezi
     *
     * @return mixed
     */
    public function apiLogin()
    {
        $iv = request()->input('iv');
        $code = request()->input('code');
        $encryptedData = request()->input('encrypted_data');

        try{
            DB::beginTransaction();

            $result = $this->wechatLogin($code,$iv,$encryptedData);

            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }

        return $result;
    }

    /**
     * 微信登录
     *
     * @author yezi
     *
     * @return mixed
     */
    public function weChatLogin($code,$iv,$encryptedData)
    {
        $weChatService = new WeChatService();
        $userInfo = $weChatService->getSessionInfo($code,$iv,$encryptedData);
        $token = $this->tokenService->createToken($userInfo);
        return $token;
    }

    public function loginView()
    {
        for ($i=1;$i<=6;$i++){
            //app(LongZuService::class)->face($i);
        }
        app(LongZuService::class)->face($i);
        /*$list = [
            'https://v.qq.com/vplus/ba4c03c861b53287f120dc8a37aa61aa#uin=ba4c03c861b53287f120dc8a37aa61aa',
            'http://v.qq.com/vplus/4034354f5c1d6be585fc9e995a19b595',
            'http://v.qq.com/vplus/467eedb08235aa6fd198c58fb86eb4dc',
            'http://v.qq.com/vplus/a5a51f39f0ebd963573f990813172070',
            'http://v.qq.com/vplus/302427c39cc916a8ee34a4e73a803f62',
            'http://v.qq.com/vplus/485bfc9edb5454d21dccdea65b26b83d',
            'http://v.qq.com/vplus/0cb8b201055cf6b91dccdea65b26b83d'
        ];
        foreach ($list as $item){
            $result = app(SpiderService::class)->videos($item);
        }*/

        /*for ($i=1;$i<=8;$i++){
            app(FangZhouService::class)->weapon();
        }*/

        /*$url = 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3160482806,2703346943&fm=26&gp=0.jpg';
        $category = app(RubbishService::class)->searchByImage($url);
        dd($category);*/

      // return view("auth.login");
    }

    public function login()
    {
        $phone = request()->input("phone");
        $password = request()->input("password");

        $result = $this->authService->attempt($phone,$password);
        if(!$result){
            throw new WebException("手机号或密码错误");
        }

        if($this->authService->auth()){
            return redirect("/admin");
        }

        return (string)$result;
    }

    public function test()
    {
        for ($i=1;$i<=2;$i++){
            $result = app(SpiderService::class)->firstGame($i);
        }
    }

    public function logout()
    {
        $this->authService->clearAdmin();

        return redirect("/login");
    }

}
