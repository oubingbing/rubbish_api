<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/3 0003
 * Time: 16:46
 */

namespace App\Http\Controllers\Wechat;


use App\Exceptions\ApiException;
use App\Http\Controllers\Controller;
use App\Http\Service\RubbishService;

class RubbishController extends Controller
{
    private $service;

    public function __construct(RubbishService $service)
    {
        $this->service = $service;
    }

    public function getRubbish()
    {
        return $this->service->rubbishs();
    }

    public function search()
    {
        $name = request()->input('name');
        if(!$name){
            throw new ApiException("参数错误");
        }

        $rubbish = $this->service->searchByName($name);
        if(collect($rubbish)->isNotEmpty()){
            return $this->service->formatResult($rubbish);
        }else{
            //数据接口查询
            $result = $this->service->searchByCurl($name);
            $rubbishList = collect($result)->groupBy('type');
            return $this->service->formatResult($rubbishList);
        }
    }

    public function scan()
    {
        $imageUrl = request()->input('image_url');
        if(!$imageUrl){
            throw new ApiException("参数错误");
        }

        $result = $this->service->searchByImage($imageUrl);
        $rubbishList = collect($result)->groupBy('type');
        return $this->service->formatResult($rubbishList);
    }

    public function getQuestions()
    {
        return $this->service->getQuestions();
    }
}