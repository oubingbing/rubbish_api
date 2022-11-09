<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2019/4/27
 * Time: 20:52
 */

namespace App\Http\Service;


use App\Enum\ArticleEnum;
use App\Models\Article as Model;
use App\Models\Video;
use Carbon\Carbon;

class ArticleService
{
    private $builder;

    public function storeArticle(Model $article)
    {
       $result = Model::create([
            Model::FIELD_TITLE => $article->{Model::FIELD_TITLE},
            Model::FIELD_CONTENT => $article->{Model::FIELD_CONTENT},
            Model::FIELD_POSTED_AT => $article->{Model::FIELD_POSTED_AT},
            Model::FIELD_FROM_TYPE => $article->{Model::FIELD_FROM_TYPE},
            Model::FIELD_CATEGORY_TYPE => $article->{Model::FIELD_CATEGORY_TYPE},
            Model::FIELD_STRATEGY_TYPE => $article->{Model::FIELD_STRATEGY_TYPE},
            Model::FIELD_ATTACHMENTS => $article->{Model::FIELD_ATTACHMENTS},
            Model::FIELD_GAME => !empty($article->{Model::FIELD_GAME})?$article->{Model::FIELD_GAME}:1
        ]);
        return $result;
    }

    public function builderQuery()
    {
        $this->builder = Model::query();
        return $this;
    }

    public function filter($fromType,$categoryType,$strategyType,$game)
    {
        if($fromType && $fromType != 7){
            $this->builder->where(Model::FIELD_FROM_TYPE,$fromType);
        }

        /*if($strategyType){
            $this->builder->where(Model::FIELD_STRATEGY_TYPE,$strategyType);
        }*/

        $this->builder->where(Model::FIELD_GAME,$game);

        return $this;
    }

    public function search($name)
    {
        if($name){
            $this->builder->where(Model::FIELD_TITLE,'like',"%$name%");
        }
        return $this;
    }

    public function orderBy($orderBy,$sort)
    {
        $this->builder->orderBy($orderBy,$sort);
        return $this;
    }

    public function done()
    {
        return $this->builder;
    }

    public function format($article)
    {
        $attachment = '';
        if(!empty($article->{Model::FIELD_ATTACHMENTS})){
            $attachment = $article->{Model::FIELD_ATTACHMENTS}[0];
        }else{
            foreach ($article->{Model::FIELD_CONTENT} as $content){
                if($content['type'] == 'image'){
                    $attachment = $content['content'];
                    break;
                }
            }
        }

        $article->from_string = '异人攻略';
        switch ($article->{Model::FIELD_FROM_TYPE}){
            case ArticleEnum::FROM_TYPE_OFFICIAL:
                $article->from_string = '官方攻略';
                break;
            case ArticleEnum::FROM_TYPE_YOU_XIA:
                $article->from_string = '游侠攻略';
                break;
            case ArticleEnum::FROM_TYPE_STAR_SKY:
                $article->from_string = '星空攻略';
                break;
            case ArticleEnum::FROM_TYPE_KK:
                $article->from_string = '9k攻略';
                break;
            case ArticleEnum::FROM_TYPE_FIRST_GAME:
                $article->from_string = '第一手游';
                break;
            case ArticleEnum::FROM_TYPE_NINE_GAME:
                $article->from_string = '9游攻略';
                break;
            case ArticleEnum::FROM_TYPE_THR_GAME:
                $article->from_string = '3Dgame攻略';
                break;
            case ArticleEnum::FROM_TYPE_FOUR:
                $article->from_string = '4399攻略';
                break;
        }

        $article->{Model::FIELD_POSTED_AT} = Carbon::parse($article->{Model::FIELD_POSTED_AT})->toDateString();
        $article->article_image = $attachment;

        $video = app(VideoService::class)->randGetVideo();
        if($video){
            $article->v_id = $video[0]['v_id'];
            $article->v_title = $video[0]['title'];
            $article->v_image = $video[0]['attachments'];
            /*$article->v_id = '';
            $article->v_title = '';
            $article->v_image = '';*/
        }

        return $article;
    }

    public function findById($id)
    {
        $article = Model::query()->find($id);
        return $article;
    }

    public function findByTitleDate($title,$date)
    {
        $article = Model::query()->where(Model::FIELD_TITLE,$title)->where(Model::FIELD_POSTED_AT,$date)->first();
        return $article;
    }


}