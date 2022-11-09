<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2019/7/6
 * Time: 20:35
 */

namespace App\Http\Service;


use App\Models\Examinations;

class ExaminationService
{
    public function store($answer)
    {
       $right = 0;
        $error = 0;
       foreach ($answer as $item){
           if ($item['result']== true){
               $right += 1;
           }else{
               $error += 1;
           }
       }
        $result = Examinations::create([
            Examinations::FIELD_ANSWER=>$answer,
            Examinations::FIELD_TOTAL=>count($answer),
            Examinations::FIELD_RIGHT=>$right,
            Examinations::FIELD_SCORE=>$right*10,
            Examinations::FIELD_ERROR=>$error
        ]);
        return $result;
    }

    public function getRate($score)
    {
        $count = Examinations::query()->count();
        $scoreCount = Examinations::query()->where(Examinations::FIELD_SCORE,'<',$score)->count();
        return round($scoreCount/$count,2)*100;
    }

}