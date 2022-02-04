<pre><?php
require_once '../vendor/autoload.php';

use GuzzleHttp\Client;

# 基本設定
$phpEnc = 'SJIS';
$debug = false;# レスポンスデータをvar_dump

# CSV設定
$csvEnc = 'SJIS';
$outputFile = 'rakuten.csv';

$gets = [
	['key' => ['Item', 'itemName'], 'csv' => 'Name'],
	['key' => ['Item', 'catchcopy'], 'csv' => 'Catchcopy'],
	['key' => ['Item', 'mediumImageUrls'], 'csv' => 'Images'],
	['key' => ['Item', 'itemUrl'], 'csv' => 'URL']
	];

# API設定
$requestURI = 'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706';

$params = [
	'query' => [
		'format' => 'json',
		'hasReviewFlag' => '1',
		'keyword' => 'キャンプ テント',# キーワード
		'genreId' => 101070,# ジャンルID
		'applicationId' => 1084628355096003137,
		
		
	]
];

$itemListPath = ['Items'];

function getArrayValue($data, $path) {
	$items = $data;
	foreach($path as $dir) $items = $items[$dir];
	return $items;
}
function setData($item = NULL) {
	global $gets, $csvEnc, $phpEnc;
	$row = [];
	foreach($gets as $col) $row[] = $item ? getArrayValue($item, $col['key']) : $col['csv'];
	if(!$row) return;
	if($csvEnc != $phpEnc) $row = mb_convert_encoding($row, $csvEnc, $phpEnc);
	return $row;
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


$outputData = [];

foreach($items as $item) $outputData[] = setData($item);

var_dump($outputData);

require_once 'database.php';

$sql = "INSERT INTO products (product_name, product_catchcopy, product_images,product_URL) VALUES (:Name, :Catchcopy, :Images, :URL)";

$stmt = $dbh->prepare($sql);


?></pre>


