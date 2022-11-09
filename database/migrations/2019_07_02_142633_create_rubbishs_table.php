<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRubbishsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rubbishs', function (Blueprint $table) {
            $table->increments('id');

            $table->string('name',64)->index()->comment("名称");
            $table->integer('category_id')->default(0)->index()->comment("分类");
            $table->integer('category_grandpa_id')->default(0)->index()->comment("顶级分类");
            $table->jsonb('attachments')->nullable()->comment('附件');

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
        Schema::dropIfExists('rubbishs');
    }
}
