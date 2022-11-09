<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2019/7/6
 * Time: 20:35
 */

namespace App\Http\Controllers\Wechat;


use App\Exceptions\ApiException;
use App\Http\Controllers\Controller;
use App\Http\Service\ExaminationService;
use App\Models\Examinations;

class ExaminationController extends Controller
{
    private $service;

    public function __construct(ExaminationService $service)
    {
        $this->service = $service;
    }

    public function saveRecord()
    {
        $answer = request()->input('answer');
        if(empty($answer)){
            throw new ApiException("参数错我");
        }

        $result = $this->service->store($answer);
        if(!$result){
            throw new ApiException("保存失败");
        }

        $rate = $this->service->getRate($result->{Examinations::FIELD_SCORE});
        return $rate;
    }

}