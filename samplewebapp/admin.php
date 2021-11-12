<?php require_once 'controller.php'; ?><!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>花の一覧</title>
    <link rel="stylesheet" href="admin.css">
    <script src="ajax.js"></script>
    <script src="admin.js"></script>
</head>
<body>
    <button id="init" class="warn">データベース初期化</button>
    <table>
        <thead>
            <th>商品番号</th>
            <th>名称</th>
            <th>在庫</th>
            <th>編集</th>
            <th>削除</th>
        </thead>
        <tbody id="data"><?php flowerlist(); ?></tbody>
    </table>
    <button id="create">登録・入荷</button>
    <form>
        <input type="hidden" id="id">
        <div><label for="name">品目</label><input type="text" id="name"></div>
        <div><label for="count">在庫</label><input type="number" id="count" value="0"></div>
    </form>
    <button id="buttonExe">登録</button>
    <div id="result"></div>
    
</body>
</html>