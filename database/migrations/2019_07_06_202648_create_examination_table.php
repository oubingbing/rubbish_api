<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExaminationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('examinations', function (Blueprint $table) {
            $table->increments('id');

            $table->jsonb('answer')->nullable()->comment('答题结果');
            $table->integer('total')->default(0)->comment('题目数量');
            $table->integer('right')->default(0)->comment('正确数');
            $table->integer('error')->default(0)->comment('正确数');
            $table->float('score',2)->default(0)->comment("得分");

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
        Schema::dropIfExists('examinations');
    }
}
