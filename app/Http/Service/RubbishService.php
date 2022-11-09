<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/7/3 0003
 * Time: 16:47
 */

namespace App\Http\Service;


use App\Enum\ArticleEnum;
use App\Exceptions\ApiException;
use App\Models\Article;
use App\Models\Rubbish;
use App\Models\RubbishCategory;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\DomCrawler\Crawler;
use XCrawler\XCrawler;

class RubbishService
{
    public function findByName($name)
    {
        $rubbish = Rubbish::query()->where(Rubbish::FIELD_NAME,$name)->first();
        return $rubbish;
    }

    public function findGrandpaCategory($name)
    {
        $category = RubbishCategory::query()->where(RubbishCategory::FIELD_NAME,"like","%{$name}%")->first();
        return $category;
    }

    public function storeRubbish($name,$grandpaId,$type)
    {
        $result = Rubbish::create([
            Rubbish::FIELD_NAME=>$name,
            Rubbish::FIELD_ID_CATEGORY_GRANDPA=>$grandpaId,
            Rubbish::FIELD_TYPE=>$type
        ]);
        return $result;
    }

    public function rubbishs()
    {
        $rubbishList = RubbishCategory::query()->with([
            RubbishCategory::REL_CATEGORY=>function($query){
                $query->with([
                    RubbishCategory::REL_RUBBISH=>function($query){
                        $query->where(Rubbish::FIELD_TYPE,Rubbish::ENUM_OFFICIAL)
                            ->select([
                            Rubbish::FIELD_ID,
                            Rubbish::FIELD_ID_CATEGORY,
                            Rubbish::FIELD_NAME
                        ]);
                    }
                ])->select([
                    RubbishCategory::FIELD_ID,
                    RubbishCategory::FIELD_NAME,
                    RubbishCategory::FIELD_ID_FATHER
                ]);
            }
        ])
            ->where(RubbishCategory::FIELD_LEVEL,1)
            ->select([
                RubbishCategory::FIELD_ID,
                RubbishCategory::FIELD_NAME,
                RubbishCategory::FIELD_ATTACHMENTS,
                RubbishCategory::FIELD_DESCRIBE
            ])
            ->get();


        return $rubbishList;
    }

    public function getHtml()
    {
        $html = '';
        return $html;
    }

    public function mp()
    {
        $result = $this->getHtml();
        $crawler = new Crawler();
        $crawler->addHtmlContent($result);
        $content = $crawler->filter('.rich_media_content p')->each(function(Crawler $node, $i){
            $ifImage = strpos($node->html(), 'img ');
            if($ifImage){
                $subContent = $node->filter('img')->attr('src');
                if(empty($subContent)){
                    $subContent = $node->filter('img')->attr('data-src');
                }
                return ['type'=>'image','content'=>$subContent];
            }else{
                $content = $node->text();
                return ['type'=>'text','content'=>$content];
            }
        });

        $img = '';
        foreach ($content as $item){
            if($item['type'] == 'image' && !empty($item['content'])){
                $img = $item['content'];
                break;
            }
        }

        $data = [
            'title'=>'',
            'date'=>'2018-08-29',
            'img'=>$img
        ];
        $data['content'] = $content;

        try{
            DB::beginTransaction();

            $ifArticle = app(ArticleService::class)->findByTitleDate($data['title'],$data['date']);
            if(!$ifArticle){
                $article = new Article();
                $article->{Article::FIELD_TITLE} = $data['title'];
                $article->{Article::FIELD_CONTENT} = $data['content'];
                $article->{Article::FIELD_POSTED_AT} = $data['date'];
                $article->{Article::FIELD_FROM_TYPE} = ArticleEnum::FROM_TYPE_STAR_SKY;
                $article->{Article::FIELD_CATEGORY_TYPE} = ArticleEnum::CATEGORY_TYPE_STRATEGY;
                $article->{Article::FIELD_STRATEGY_TYPE} = ArticleEnum::STRATEGY_TYPE_STAR_SKY;
                $article->{Article::FIELD_ATTACHMENTS} = [$data['img']];
                $article->{Article::FIELD_GAME} = 2;
                app(ArticleService::class)->storeArticle($article);
            }

            DB::commit();
        }catch (\Exception $e){
            DB::rollBack();
            //throw $e;
        }
    }

    public function searchByName($name)
    {
        $rubbishs = Rubbish::query()
            ->with([
                Rubbish::REL_TYPE=>function($query){
                    $query->select([
                        Rubbish::FIELD_ID,
                        Rubbish::FIELD_NAME
                    ]);
                }
            ])
            ->where(Rubbish::FIELD_NAME,'like',"%$name%")
            ->select([
                Rubbish::FIELD_NAME,
                Rubbish::FIELD_ID_CATEGORY_GRANDPA,
                Rubbish::FIELD_ID
            ])
            ->get();

        foreach ($rubbishs as &$rubbish){
            $rubbish['f_name'] = $rubbish['type']['name'];
        }

        $rubbishs = collect($rubbishs)->groupBy('f_name');

        return collect($rubbishs)->toArray();
    }

    public function formatResult($result)
    {
        $list = [];
        foreach (collect($result)->toArray() as $key => $item){
            $color = '';
            switch($key){
                case '可回收物':
                    $color = 'huishou-c';
                    break;
                case '有害垃圾':
                    $color = 'youhai-c';
                    break;
                case '湿垃圾':
                    $color = 'si-c';
                    break;
                case '干垃圾':
                    $color = 'gan-c';
                    break;
            }
            array_push($list,['category'=>$key,'rubbishs'=>$item,'color'=>$color]);
        }

        return $list;
    }

    public function searchByImage($imageUrl)
    {
        $result = app(Http::class)->getImageTag($imageUrl);
        if(!$result){
            throw new ApiException("系统错误",500);
        }

        $tags = $result['tags'];
        $list = [];
        foreach ($tags as $tag){
            $dataList = $this->searchByCurl($tag['value']);
            foreach ($dataList as $item){
                array_push($list,$item);
            }
        }

        return $list;
    }

    public function searchByCurl($name)
    {
        $list = $this->getKey($name);
        $crawler = new Crawler();
        $crawler->addHtmlContent($list);
        $key = Hash::make($name);

        $result = [];
        $list = $crawler->filter('.kehuishou_c_1')->each(function(Crawler $node, $i) use($key){
            $name = $node->filter('p')->text();
            $type = $node->filter('span')->text();

            redis()->lpush($key, json_encode(['name'=>$name,'type'=>$type]));

            $rubbish = $this->findByName($name);
            if(!$rubbish){
                $grandpa = $this->findGrandpaCategory($type);
                if($grandpa){
                    $grandpaId = $grandpa->{RubbishCategory::FIELD_ID};
                    $this->storeRubbish($name,$grandpaId,Rubbish::ENUM_COLLECT);
                }
            }
        });

        $result = [];
        while ($data = redis()->rpop($key)) {
            $data = json_decode($data, true);
            $result[] = $data;
        }

        return $result;
    }

    public function getKey($name)
    {
        $url = 'https://trash.lhsr.cn/sites/feiguan/trashTypes_3/TrashQuery.aspx?kw='.$name;
        $response = app(Http::class)->get($url, null, $header = []);
        if($response["status_code"] != 200){
            throw new ApiException("查询失败",500);
        }
        return $response['result'];
    }

    public function getQuestions()
    {
        $ids = Rubbish::query()->pluck(Rubbish::FIELD_ID);
        $ids = collect($ids)->toArray();
        $questionIds = [];
        for ($i = 1;$i <= 10;$i ++ ){
            array_push($questionIds,array_random($ids));
        }

        $questions = Rubbish::query()
            ->whereIn(Rubbish::FIELD_ID,$questionIds)
            ->select([
                Rubbish::FIELD_ID,
                Rubbish::FIELD_NAME,
                Rubbish::FIELD_ID_CATEGORY_GRANDPA
            ])
            ->get();

        return $questions;
    }

}