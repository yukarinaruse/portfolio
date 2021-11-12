<?php require_once 'samplewebapp/controller.php'; ?><!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SampleWebApp</title>
    <script src="samplewebapp/ajax.js"></script>
    <script src="samplewebapp/index.js"></script>
</head>
<body>
    <div><a href"admin.php">管理画面</a></div>
    <hr>
    <form>
        <select id="item"><?php options(); ?></select>
        <button id="search">検索</button>
    </form>
    <div id="respons"</div>    
</body>
</html>