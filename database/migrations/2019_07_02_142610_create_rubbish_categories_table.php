<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRubbishCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rubbish_categories', function (Blueprint $table) {
            $table->increments('id');

            $table->string('name',64)->index()->comment("名称");
            $table->string('father_id')->index()->nullable()->comment("父类分级ID");
            $table->tinyInteger('level')->default(1)->comment("分类等级");
            $table->jsonb('describe')->nullable()->comment("分类描述");
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
        Schema::dropIfExists('rubbish_categories');
    }
}
