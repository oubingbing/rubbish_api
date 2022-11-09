<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->increments('id');

            $table->string("title",128)->default("")->comment("笔记的标题");
            $table->longText("content")->nullable()->comment("笔记内容");
            $table->jsonb("attachments")->nullable()->comment("封面图片，暂时为空");

            $table->tinyInteger("from_type")->default(1)->comment("来源类型1=官网，2=第三方");
            $table->tinyInteger("category_type")->default(1)->comment("文章类型,1=攻略，2=新闻资讯，3=妖灵图鉴");
            $table->tinyInteger("strategy_type")->default(1)->comment("攻略类型，1=图灵攻略，2=官方，3=新手指南，活动玩法");
            $table->tinyInteger("status")->default(1)->comment("状态");

            $table->timestamp('posted_at')->nullable()->comment("发布日期")->index();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('articles');
    }
}
