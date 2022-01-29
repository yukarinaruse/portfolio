<?php
// ---------------------------------------------------------------
// 楽天商品検索API の利用サンプルコード (PHP)
// ---------------------------------------------------------------
// 以下を変更してPHP4が動作する公開領域におくだけでOK
// 詳細な仕様は以下を参照
// - 楽天ウェブサービス- http://webservice.rakuten.co.jp/
//
// UTF-8で保存すること
/* ---------------- 以下、変更部分 ------------------------------ */

// 自分のディベロッパーID

$DEVELOPER_ID = "1092419859303667239";

//自分のアフィリエイトID

$AFFILIATE_ID = "2388c07c.3b4a440c.2388c07d.42f178c6";

/* ---------------- 以上、変更部分 ------------------------------ */

//--------- API毎の固定値
// API名
$API_NAME       = "楽天商品検索API";

// APIのURL
$API_BASE_URL   = "http://api.rakuten.co.jp/rws/1.3/rest";

//オペレーション名
$OPERATION      = "ItemSearch";

//バージョン
$API_VERSION    = "2007-02-14";

//--------- リクエストパラメタの取得とAPIへのリクエストURL生成

// リクエストURL生成
$api_url = sprintf("%s?developerId=%s&affiliateId=%s&operation=%s",$API_BASE_URL,$DEVELOPER_ID,$AFFILIATE_ID,$OPERATION);

//APIへのパラメタの連想配列
$api_params          = array(
    "keyword"        => "",
    "version"        => $API_VERSION,
    "shopCode"       => "",
    "genreId"        => "",
    "catalogCode"    => "",
    "hits"           => "",
    "page"           => "",
    "sort"           => "",
    "minPrice"       => "",
    "maxPrice"       => "",
    "availability"   => "",
    "field"          => "",
    "carrier"        => "",
    "imageFlag"      => ""
);

// リクエストパラメタ取得
reset($api_params);
while(list ($key, $val) = each($api_params) ){
    if(isset($_REQUEST[$key]) && $_REQUEST[$key] != ""){
        // リクエストパラメタにあれば、APIへのURLに追加
        $api_url = sprintf("%s&%s=%s",$api_url, $key, urlencode($_REQUEST[$key]));
        $api_params[$key] = $_REQUEST[$key];
    }else if(isset($api_params[$key]) && $api_params[$key] != ""){
        // パラメタにあれば、APIへのURLに追加
        $api_url = sprintf("%s&%s=%s",$api_url, $key, urlencode($api_params[$key]));
    }
}

// --------- API取得処理
// API結果ステータス
$status     = null;

// API結果メッセージ
$statusmsg  = null;

// 商品情報の配列
$item_array = array();

// 結果件数
$count      = 0;

// 商品検索ボタンを押された時、APIにリクエストを投げる
if( isset($_REQUEST['submit']) && $_REQUEST['submit'] == "商品検索" ){
    
    $contents = file_get_contents($api_url);
    
    // XMLをパースして構造体（values）に入れる
    $parser = xml_parser_create('UTF-8');
    xml_parse_into_struct($parser,$contents,$values);
    xml_parser_free($parser); 
    
    // 連想配列から値を取得
    if($values){
        $item_temp  = null;
        foreach ($values as $data) {
            if(isset($data['tag'])){
                // タグ名のよって分岐
                switch ($data['tag']) {
                    case 'STATUS':                          //共通パラメータ：Status
                        if(isset($data['value'])){
                            $status  = $data['value'];
                        }
                        break;
                    case 'STATUSMSG':                       //共通パラメータ：Statusに特化したメッセージ
                        if(isset($data['value'])){
                            $statusmsg  = $data['value'];
                        }
                        break;
                    case 'COUNT':                           //全体情報：検索数
                        if(isset($data['value'])){
                            $count  = $data['value'];
                        }
                        break;
                    case 'ITEM':                            //商品情報：ITEMタグ開始
                        if($data['type'] == 'open'){
                            $item_temp = array();
                        }else if($data['type'] == 'close'){ //商品情報：ITEMタグ終了
                            array_push($item_array,$item_temp);
                            $item_temp = null;
                        }
                        break;
                    default:
                        if(is_array($item_temp)){           //商品情報：ITEMタグ終了
                            if(isset($data['value'])){
                                $item_temp[$data['tag']] = $data['value'];
                            }
                        }
                        break;
                }
            }
        }
    }
    // 以下からHTML表示部分
}

header("Content-type:text/html;charset=UTF-8");
?>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title><?=$API_NAME?>／楽天ウェブサービス</title>
</head>
<body bgcolor="#ffffff" TEXT="#333333" LINK="#3333cc">

<!-- タイトル -->
<h1 style="font-size:16px;font-weight:bold;">楽天ウェブサービス</h1><hr size="1" noshade><?=$API_NAME?><hr size="1" noshade>
<!--/タイトル -->

<!-- HTMLフォーム表示 -->
<form action="item_search.php" method="post">
<table width="60%" border="0" cellspacing="0" cellpadding="0" style="margin: 5px 0pt 0pt 0px;">
<tr><td bgcolor="#afafaf">
<table width="100%" border=0 cellspacing=1 cellpadding=5 style="font-size:12px;">
<tr><td style="background-color: #eeeeee;">検索キーワード</td><td style="background-color: #ffffff;">
<!-- キーワード入力テキストボックス --><input type="text" name="keyword" value="<?=htmlspecialchars($api_params['keyword'])?>" size="30">
</td></tr>
<tr><td style="background-color: #eeeeee;">価格</td><td style="background-color: #ffffff;">
<!-- 最小価格入力テキストボックス -->
<input type="text" name="minPrice" value="<?=htmlspecialchars($api_params['minPrice'])?>" size="15"> 円
～
<!-- 最上価格入力テキストボックス -->
<input type="text" name="maxPrice" value="<?=htmlspecialchars($api_params['maxPrice'])?>" size="15"> 円
</td></tr>
</table>
</td></tr></table><br>
<input type="submit" name="submit" value="商品検索">
</form>
<!-- HTMLフォーム表示 -->

<!-- API検索結果表示 -->
<font style="font-size:14px;">
<?php if($status    != ""){ ?>取得結果: <?=$status?><br><? } ?>
<?php if($statusmsg != ""){ ?>取得内容: <?=$statusmsg?><br><? } ?>
<?php if($count > 0){       ?>取得件数: <?=$count?><br>
<table width="60%" border="0" cellspacing="0" cellpadding="0" style="margin: 5px 0pt 0pt 0px;">
<tr><td bgcolor="#afafaf">
<table width="100%" border=0 cellspacing=1 cellpadding=5 style="font-size:12px;">
<tr align="center" style="background-color: #eeeeee;">
<td width="8%" >写真</td>
<td width="47%">商品名</td>
<td width="15%">価格</td>
<td width="30%">ショップ名</td>
</tr>
<?php foreach ($item_array as $item){ ?>
<tr style="background-color: #ffffff;">
<td width="8%"  align="center"><a href="<?=$item['ITEMURL']?>" target="_top"><img src="<?=$item['SMALLIMAGEURL']?>" border=0></a></td>
<td width="47%" align="left"><a href="<?=$item['AFFILIATEURL']?>" target="_top"><font size="-1"><?=$item['ITEMNAME']?></a></td>
<td width="15%" align="right" nowrap> <?=$item['ITEMPRICE']?> 円</td>
<td width="47%" align="left"><a href="<?=$item['SHOPURL']?>" target="_top"><font size="-1"><?=$item['SHOPNAME']?></a></td>
</tr>
<?php } ?>
</table>
</td></tr></table>
<?php } ?>
</font>
<!-- /API検索結果表示 -->

</body>
</html>