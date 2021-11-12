<?php
#接続
const HOST = 'localhost';# ホスト名
const USER = 'root';# 接続ユーザー名
const PASS = 'YourSecurePassword';# パスワード


# glibalで使うmysqliオブジェクト
$link;

# $dbname = DatabaseName:接続するユーザー名（省略可）
function connect($dbname = NULL) {
    global $link;
    $link = $dbname ? new mysqli(HOST,USER,PASS,$dbname) : new mysqli(HOST,USER,PASS);
    $ok = !$link->connect_error;
    if($ok) $link->set_charset('utf8mb4');# 文字コード指定　UTF-8ではなくytf8mb4
    return $ok;
}

#SELECT文を実行して結果を取得
function select($sql, $display = false) {
    global $link;
    $result = $link->query($sql);
    $rows = [];
    while($row = $result->fetch_assoc()) $row;
    $result->close();
    if($display) echo "{$sql}\n";
    return $rows;
}

# SELECT文以外を実行するだけ
function execute($sql, $display = false) {
    global $link;
    $link>query($sql);
    if($display) echo"{$sql}\n";
    return !$link->error;
}
?>