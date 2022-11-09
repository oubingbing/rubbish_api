<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/3 0003
 * Time: 16:36
 */

namespace App\Models;


class Rubbish extends BaseModel
{
    const TABLE_NAME = 'rubbishs';
    protected $table = self::TABLE_NAME;

    const FIELD_ID = 'id';
    const FIELD_NAME = 'name';
    const FIELD_ID_CATEGORY = 'category_id';
    const FIELD_ID_CATEGORY_GRANDPA = 'category_grandpa_id';
    const FIELD_ATTACHMENTS = 'attachments';
    const FIELD_TYPE = 'type';

    const ENUM_OFFICIAL = 1;
    const ENUM_COLLECT = 2;

    protected $fillable = [
        self::FIELD_ID,
        self::FIELD_NAME,
        self::FIELD_ATTACHMENTS,
        self::FIELD_ID_CATEGORY,
        self::FIELD_ID_CATEGORY_GRANDPA,
        self::FIELD_TYPE
    ];

    const REL_CATEGORY = 'category';
    const REL_TYPE = 'type';

    public function category()
    {
        return $this->belongsTo(RubbishCategory::class,self::FIELD_ID_CATEGORY,RubbishCategory::FIELD_ID)->where(RubbishCategory::FIELD_LEVEL,2);
    }

    public function type()
    {
        return $this->belongsTo(RubbishCategory::class,self::FIELD_ID_CATEGORY_GRANDPA,RubbishCategory::FIELD_ID)->where(RubbishCategory::FIELD_LEVEL,1);
    }

}