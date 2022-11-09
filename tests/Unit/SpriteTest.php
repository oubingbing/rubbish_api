<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/5 0005
 * Time: 10:56
 */

namespace Tests\Unit;


use App\Http\Service\DNFService;
use App\Http\Service\SpiderService;
use App\Http\Service\YirenzhixiaService;
use App\Http\Wechat\BattlefieldService;
use Tests\TestCase;

class SpriteTest extends TestCase
{
    /**
     * @test
     */
    public function storeSprite()
    {
        app(SpiderService::class)->querySprite();
    }

    /**
     * @test
     */
    public function storeSkill()
    {
        app(SpiderService::class)->querySpriteSkill();
    }

    /**
     * @test
     */
    public function storeStone()
    {
        app(SpiderService::class)->querySpriteStone();
    }

    /**
     * vendor/bin/phpunit tests/unit/SpriteTest.php --filter=storerw
     * @test
     */
    public function storerw()
    {
        app(SpiderService::class)->getMask();
    }

    /**
     * vendor/bin/phpunit tests/unit/SpriteTest.php --filter=datainfo
     * @test
     */
    public function datainfo()
    {
        app(SpiderService::class)->getDataInfo();
    }

    /**
     * vendor/bin/phpunit tests/unit/SpriteTest.php --filter=article
     * @test
     */
    public function article()
    {
        for ($i=1;$i<=5;$i++){
            $result = app(DNFService::class)->th3($i);
        }
        //$result = app(SpiderService::class)->prod();
    }
}