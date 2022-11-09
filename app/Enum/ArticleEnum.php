<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2019/4/27
 * Time: 20:33
 */

namespace App\Enum;


class ArticleEnum
{
    //来源
    const FROM_TYPE_OFFICIAL = 1;
    const FROM_TYPE_YOU_XIA = 2;
    const FROM_TYPE_STAR_SKY = 3;
    const FROM_TYPE_KK = 4;
    const FROM_TYPE_FIRST_GAME = 5;
    const FROM_TYPE_NINE_GAME = 6;
    const FROM_TYPE_THR_GAME = 8;
    const FROM_TYPE_FOUR = 9;

    //类型
    const CATEGORY_TYPE_STRATEGY = 1;
    const CATEGORY_TYPE_NEWS = 2;
    const CATEGORY_TYPE_HANDBOOK = 3;
    const CATEGORY_TYPE_NOTICE = 4;
    const CATEGORY_TYPE_ACTIVITY = 5;
    const CATEGORY_TYPE_MATERIAL = 6;
    const CATEGORY_SHOU_YOU = 7;

    //策略类型
    const STRATEGY_TYPE_TULIN = 1;
    const STRATEGY_TYPE_OFFICIAL_DIRECTER = 2;
    const STRATEGY_TYPE_DIRECTER = 3;
    const STRATEGY_TYPE_ACTIVITY = 4;
    const STRATEGY_TYPE_YOU_XIA = 5;
    const STRATEGY_TYPE_STAR_SKY = 6;
    const STRATEGY_TYPE_KK = 7;
    const STRATEGY_TYPE_FIRST_GAME = 8;
    const STRATEGY_TYPE_NINE_GAME = 9;
    const STRATEGY_TYPE_THR3 = 10;
    const STRATEGY_TYPE_FOUR = 11;
}