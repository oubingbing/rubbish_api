<?php
/**
 * Created by PhpStorm.
 * User: bingbing
 * Date: 2018/5/26
 * Time: 17:44
 */

namespace App\Http\Service;


use GuzzleHttp\Client;

class EmailService
{
    private $url;
    private $apiUser;
    private $appKey;
    private $client;

    public function __construct()
    {
        $this->url     = 'http://api.sendcloud.net/apiv2/mail/send';
        $this->apiUser = env('SEND_CLOUD_API_USER');
        $this->appKey  = env('SEND_CLOUD_APP_KEY');
        $this->client  = new Client;
    }

    public function sendRegisterEmail($receiveEmail,$content)
    {
        $result = $this->send('ouzhibing@outlook.com',$receiveEmail,$content);

        return $result;
    }

}