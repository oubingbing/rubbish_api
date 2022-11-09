<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2019/4/27
 * Time: 20:30
 */

namespace App\Models;


class Article extends BaseModel
{
    const TABLE_NAME = 'articles';
    protected $table = self::TABLE_NAME;

    /** 笔记标题 */
    const FIELD_TITLE = 'title';

    /** 笔记的内容 */
    const FIELD_CONTENT = 'content';

    /** 笔记的封面 */
    const FIELD_ATTACHMENTS = 'attachments';

    /** 文章来源 **/
    const FIELD_FROM_TYPE = 'from_type';

    /** 文章类型 **/
    const FIELD_CATEGORY_TYPE = 'category_type';

    /** 攻略类型 **/
    const FIELD_STRATEGY_TYPE = 'strategy_type';

    /** 状态 **/
    const FIELD_STATUS = 'status';

    /** field posted 发布日期 */
    const FIELD_POSTED_AT = 'posted_at';

    const FIELD_GAME = 'game';

    protected $casts = [
        self::FIELD_ATTACHMENTS => 'array',
        self::FIELD_CONTENT => 'array',
    ];

    protected $fillable = [
        self::FIELD_ID,
        self::FIELD_TITLE,
        self::FIELD_CONTENT,
        self::FIELD_ATTACHMENTS,
        self::FIELD_FROM_TYPE,
        self::FIELD_STRATEGY_TYPE,
        self::FIELD_CATEGORY_TYPE,
        self::FIELD_STATUS,
        self::FIELD_POSTED_AT,
        self::FIELD_GAME
    ];
}