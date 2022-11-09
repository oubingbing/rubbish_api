<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2019/7/6
 * Time: 20:31
 */

namespace App\Models;


use PhpParser\Node\Expr\ShellExec;

class Examinations extends BaseModel
{
    const TABLE_NAME = 'examinations';
    protected $table = self::TABLE_NAME;

    const FIELD_ID = 'id';
    const FIELD_ANSWER = 'answer';
    const FIELD_TOTAL = 'total';
    const FIELD_RIGHT = 'right';
    const FIELD_ERROR = 'error';
    const FIELD_SCORE = 'score';

    protected $casts = [
        self::FIELD_ANSWER => 'array',
    ];

    protected $fillable = [
        self::FIELD_ID,
        self::FIELD_ANSWER,
        self::FIELD_TOTAL,
        self::FIELD_RIGHT,
        self::FIELD_ERROR,
        self::FIELD_SCORE
    ];
}