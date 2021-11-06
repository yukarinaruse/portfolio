<?php
require 'vendor/autoload.php';

use GuzzleHttp\Client;

$KEYID = "2f6949c92ee3342d";
$HIT_PER_PAGE = 100;
$PREF = "Z011";
$FREEWORD = "渋谷駅";
$FORMAT = "json";

$PARAMS = ["key"=> $KEYID, "count"=>$HIT_PER_PAGE, "pref"=>$PREF, "keyword"=>$FREEWORD, "format"=>$FORMAT];

function write_data_to_csv($params){
    
    $restaurants = [];
    $response = new Client();
    try{
        $json_res = $client->request('GET',"http://webservice.recruit.co.jp/hotpepper/gourmet/v1/", ['query' => $params])->getBody();
    }catch(Exception $e){
        return print("エラーが発生しました。APIのURLを確認してください。");
    }
    $response = json_decode($json_res,true);

if(isset($response["results"]["error"])){
    return print("エラーが発生しました。APIのパラメータを確認してください。");
}

foreach($response["results"]["shop"] as &$resutaurant){
        $restaurant_name =$restaurant["name"];
        $restaurants[] = $restaurant_name;
    }
$handle = fopen("restaurants_list.csv","wb");
fputcsv($handle,$restaurants);
fclose($handole);
return ptint_r($restaurants);
}

write_data_to_csv($PARAMS);
?>