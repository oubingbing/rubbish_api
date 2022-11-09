<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/28 0028
 * Time: 9:43
 */

namespace App\Http\Controllers\Wechat;


use App\Http\Controllers\Controller;
use App\Http\Service\ArticleService;
use App\Models\Article;
use Carbon\Carbon;

class ArticleController extends Controller
{
    private $articleService;

    public function __construct(ArticleService $articleService)
    {
        $this->articleService = $articleService;
    }

    /**
     * 文章列表
     *
     * @author yezi
     * @return array
     */
    public function articleList()
    {
        $pageSize   = request()->input('page_size', 20);
        $pageNumber = request()->input('page_number', 1);
        $orderBy    = request()->input('order_by', 'posted_at');
        $sortBy     = request()->input('sort_by', 'desc');
        $fromType   = request()->input('from_type');
        $categoryType = request()->input('category');
        $strategyType = request()->input('strategy_type');
        $search       = request()->input('search');
        $game       = request()->input('game',1);

        $pageParams = ['page_size' => $pageSize, 'page_number' => $pageNumber];

        $query = $this->articleService->builderQuery()->filter($fromType,$categoryType,$strategyType,$game)->search($search)->orderBy($orderBy, $sortBy)->done();

        $goodsData = paginate($query, $pageParams, "*", function ($item) {
            $item = $this->articleService->format($item);
            $item->{Article::FIELD_CONTENT} = '';
            $today = Carbon::now()->toDateString();
            $postAt = Carbon::parse($item->{Article::FIELD_POSTED_AT})->toDateString();
            return [
                'id'=>$item->id,
                'title'=>$item->{Article::FIELD_TITLE},
                'from_string'=>$item->from_string,
                'posted_at'=>$item->{Article::FIELD_POSTED_AT},
                'article_image'=>$item->article_image,
                'is_new'=>$today==$postAt?1:0
            ];
        });
        return $goodsData;
    }

    public function detail($id)
    {
        $article = $this->articleService->findById($id);
        $article = $this->articleService->format($article);
        return $article;
    }
}