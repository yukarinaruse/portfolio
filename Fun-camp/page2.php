<pre><?php
require_once 'rws-php-sdk-1.1.0/autoload.php';

use GuzzleHttp\Client;

# 基本設定
$phpEnc = 'UTF-8';
$debug = false;# レスポンスデータをvar_dump

# CSV設定
$csvEnc = 'SJIS';
$outputFile = 'rakuten.csv';
#$gets = [
#	['key' => 'name', 'csv' => '名称'],
#	['key' => 'open', 'csv' => '営業日'],
#	['key' => 'address', 'csv' => '住所'],
#	['key' => 'access', 'csv' => 'アクセス']
#];
$gets = [
	['key' => ['Item', 'itemName'], 'csv' => '品名'],
	['key' => ['Item', 'shopName'], 'csv' => '店名'],
	['key' => ['Item', 'itemPrice'], 'csv' => '価格'],
	['key' => ['Item', 'itemUrl'], 'csv' => 'URL']
];

# API設定
#$requestURI = 'http://webservice.recruit.co.jp/hotpepper/gourmet/v1/';
$requestURI = 'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706';

#$params = [
#	'query' => [
#		'key' => 'df139253fc582213',
#		'count' => 100,
#		'keyword' => '新宿駅',
#		'format' => 'json'
#	]
#];
$params = [
	'query' => [
		'format' => 'json',
		'keyword' => 'キャンプ　テント',# キーワード
		'genreId' => 302373,# ジャンルID
		'applicationId' =>1084628355096003137, //アプリケーションID(桁数の多い数字)
	]
];
# データ配列の階層
#$itemListPath = ['results', 'shop'];
$itemListPath = ['Items'];

function getArrayValue($data, $path) {
	$items = $data;
	foreach($path as $dir) $items = $items[$dir];
	return $items;
}
function writeCSV($handle, $item = NULL) {
	global $gets;
	$row = [];
	foreach($gets as $col) $row[] = $item ? getArrayValue($item, $col['key']) : $col['csv'];
	if(!$row) return;
	if($csvEnc != $phpEnc) $row = mb_convert_encoding($row, $csvEnc, $phpEnc);
	fputcsv($handle, $row);
}

# 取得
$client = new Client();
try {
	$json_res = $client->request('GET', $requestURI, $params)->getBody();
} catch(Exception $e) {
	return print('エラーが発生しました。APIのURLを確認してください。');
}
$response = json_decode($json_res, true);

if($debug) var_dump($response);

$items = getArrayValue($response, $itemListPath);

#if(isset($response['results']['error'])) return print('エラーが発生しました。APIのパラメータを確認してください。');

$handle = fopen($outputFile, 'wb');

writeCSV($handle);
foreach($items as $item) writeCSV($handle, $item);

# 開いたファイルは忘れずに閉じる
fclose($handle);
?></pre>