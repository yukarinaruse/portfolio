<?php
#モードが空の場合、何をするかわからないので、処理中断
if(empty($_GET['mode'])) exit;

require_once 'database.php';

function echoHTML($sql,$msg) {
    global $link;
    
    
# SQL実行
    $response = execute($sql) ? $msg : $link->error;
    
# 実行したSQLの記録
    execute("INSERT INTO `sqllog` (`sql`) VALUES('" . str_replace("'","''",$sql) ."');");
    
# 管理画面の品目一覧のﾃｰﾌﾞﾙHTMLを生成
    include 'showData.php';
    
    #切断
    $link->close();
    
    $json = [
            'result' => $response,
            'html' => $html
    ];
    
# PHPの連想配列をjson_encodeすると、Javascriptのオブジェクトにそのまま使える文字列になります。
# {"result":"登録完了","html":'<tr>~</tr>'}
    echo json_encode($json);
}

switch($_GET['mode']) {
        case 'search':
# $_POST['name']が空の場合、エラーのレスポンスを返して、処理中断
                if(empty($_POST['name'])) {
                    echo '{"result":2,"count":0}';
                    break;
                }
        
# 接続　失敗時処理中断
            if(!connect('flower')) {
                    echo '{"result":3,"count":0}';
                    break;
            }
        
            $sql = "SELECT `count` FROM `flower` WHERE `name`='" . str_replace("'","''",$_POST['name']) . "';";
            $zaiko = select($sql);
            if(count($zaiko)) {# zaiko.length 0だとfalse扱いになる　1以上ならtrue扱い
                    echo '{"result":0,"count":' . $zaiko[0]['count'] . '}';# {"result":0,"count":4}
                    break;
        }
        
# 実行したSQLの記録
        execute("INSERT INTO `sqllog` (`sql`) VALUES('" . str_replace("'","''",$sql) . "');");
    
            echo '{"result":1,"count":0}';#存在しない花
            break;
            
        case 'create':
            if(empty($_POST['name']) || (empty($_POST['count']) && $_POST['count'] !== '0')) {
                echo '("result":"品目と在庫を正しく入力してください。"}';
                break;
            }
        
# 接続　失敗時処理中断
        if(!connect('flower')) {
                echo '{"result":"' . $link->connect_error . '"}';
                break;
        }
        
# すでにある品目かどうか確認        
            $sql = "SELECT `count` FROM `flower` WHERE `name`='" . str_replace("'","''", $_POST['name']) ."';";
            $result = select($sql);
        
# 実行したSQLの記録
            execute("INSERT INTO `sqllog`(`sql`)VALUES('" . str_replace("'","''",$sql) . "');"); 
        
            if(count($result)) {# 1件存在
# UPDATE
                echoHTML("UPDATE `flower` SET `count`=" .((int)$result[0]['count'] + (int)$_POST['count']) . "WHERE `name`='" . str_replace("'","''".$_POST['name']) . "';", '在庫を追加しました');
        } else {# 0件＝存在しない
# INSERT
                echoHTML("INSERT INTO `flower`(`name`,`count`) VALUES('" . str_replace("'","''",$_POST['name']) . "'," . (int)$_POST['count'] . ');','登録完了');
        }
        break;
        
    case 'update':
            if((empty($_POST['id']) && $_POST['id'] !=='0') || empty($_POST['name']) || (empty($_POST['count']) && $_POST['count'] !== '0')){
                    echo '{"result":"パラメーターが正しくありません。"}';
                    break;
            }
# 接続　失敗時処理中断
            if(!connect('flower')) {
                    echo '{"result"' . $link->connect_error . '"}';
                    break;
            }
        
# UPDATE
            echoHTML("UPDATE `flower` SET `name`='" . str_replace("'","''",$_POST['name']) . "',`count`=" . (int)$_POST['count'] . ' WHERE `id`=' . (int)$_POST['id'] . ';', '更新完了');
            break;
    
    case 'delete':
            if(empty($_POST['id']) && $_POST['id'] !== '0') {
                    echo '{"result":"パラメーターが正しくありません。"}';
                    break;
            }
        
# 接続　失敗時処理中断
            if(!connect('flower')) {
                    echo '{"result":"' . $link->connect_error . '"}';
                    break;
            }
        
# DELETE
            echoHTML('DELETE FROM `flower` WHERE `id`=' . (int)$_POST['id'] . ';', '削除完了');
}

# 切断
$link->close();
?>