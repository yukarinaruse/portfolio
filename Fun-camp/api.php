<pre><?php
require_once '../vendor/autoload.php';

use GuzzleHttp\Client;

# 基本設定
$phpEnc = 'SJIS';
$debug = false;# レスポンスデータをvar_dump
$view = false;# 収集したデータをvar_dump

# CSV設定
$csvEnc = 'SJIS';
$outputFile = 'rakuten.csv';


# `product_name`, `product_catchcopy`, `product_images`, `product_URL`
$gets = [
	['name' => 'product_name', 'key' => ['Item', 'itemName'], 'csv' => 'Name'],
	['name' => 'product_catchcopy', 'key' => ['Item', 'catchcopy'], 'csv' => 'Catchcopy'],
	['name' => 'product_images', 'key' => ['Item', 'mediumImageUrls', 0, 'imageUrl'], 'csv' => 'Images'],
	['name' => 'product_URL', 'key' => ['Item', 'itemUrl'], 'csv' => 'URL']
];

# API設定
$requestURI = 'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706';

$params = [
	'query' => [
		'format' => 'json',
		'hasReviewFlag' => '1',
		'keyword' => 'キャンプ',# キーワード
		'genreId' => 101070,# ジャンルID
		'applicationId' => 1084628355096003137
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
	foreach($gets as $col) $row[$col['name']] = $item ? getArrayValue($item, $col['key']) : $col['csv'];
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
$sqlHead = 'INSERT INTO `products` (`product_name`, `product_catchcopy`, `product_images`, `product_URL`) VALUES';
$sql = '';
foreach($items as $item) {
	$itemData = setData($item);
	$outputData[] = $itemData;
	if($sql) $sql .= ',';
	$sql .= "('{$itemData['product_name']}','{$itemData['product_catchcopy']}','{$itemData['product_images']}','{$itemData['product_URL']}')";
}
$sql = $sqlHead . $sql . ";";
# 接続
require_once 'database.php';

# 実行
$mysqli->query($sql . ';');

# 切断
$mysqli->close();

# $sql = "INSERT INTO `products` (`product_name`, `product_catchcopy`, `product_images`, `product_URL`) VALUES (:Name, :Catchcopy, :Images, :URL)";
# $stmt = $mysqli->prepare($sql);

# 内容確認
if($view) var_dump($outputData);
?></pre>