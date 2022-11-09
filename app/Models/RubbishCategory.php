<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/3 0003
 * Time: 16:37
 */

namespace App\Models;


class RubbishCategory extends BaseModel
{
    const TABLE_NAME = 'rubbish_categories';
    protected $table = self::TABLE_NAME;

    const FIELD_ID = 'id';
    const FIELD_NAME = 'name';
    const FIELD_ID_FATHER = 'father_id';
    const FIELD_LEVEL = 'level';
    const FIELD_DESCRIBE = 'describe';
    const FIELD_ATTACHMENTS = 'attachments';

    protected $fillable = [
        self::FIELD_ID,
        self::FIELD_NAME,
        self::FIELD_ID_FATHER,
        self::FIELD_LEVEL,
        self::FIELD_DESCRIBE,
        self::FIELD_ATTACHMENTS
    ];

    const REL_RUBBISH = 'rubbish';
    const REL_CATEGORY = 'category';

    protected $casts = [
        self::FIELD_ATTACHMENTS => "array"
    ];

    public function rubbish()
    {
        return $this->hasMany(Rubbish::class,Rubbish::FIELD_ID_CATEGORY,self::FIELD_ID);
    }

    public function category()
    {
        return $this->hasMany(RubbishCategory::class,RubbishCategory::FIELD_ID_FATHER,self::FIELD_ID);
    }

}