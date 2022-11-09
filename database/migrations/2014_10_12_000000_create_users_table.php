<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('nickname')->comment('用户微信昵称');
            $table->string('avatar')->default('')->comment('微信头像');
            $table->string('phone',18)->default('')->comment('手机号码');
            $table->tinyInteger('gender')->default(0)->comment('默认一个性别');
            $table->string('open_id')->unique()->default('')->index();
            $table->string('union_id')->default('')->index();
            $table->string('city')->default('');
            $table->string('country')->default('');
            $table->string('language')->default("zh_CN");
            $table->string('province')->default('');

            $table->tinyInteger('type')->default(0)->comment('用户类型');
            $table->tinyInteger('status')->default(0)->comment('用户状态');

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
        Schema::dropIfExists('users');
    }
}
