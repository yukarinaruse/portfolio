<?php
require_once 'detabase.php';

# index.phpから呼び出される
function options() {
    global $link;
#接続　失敗時処理中断
    if(!connect('floewr')) return;
    
# flowerから花一覧を取得
    $list = select('SELECT `name` FROM `flower`;');
    
# <option value="Rose">Rose</option>
    $html = '';
    foreach($list as $item) $html .= '<option value="' . $item['name'] . '">' . $item['name'] . '</option>';
    
# 切断
    $link->close();
    
    echo $html;
}

# admin.phpから呼び出される
function flowerlist() {
    global $link;
#接続　失敗時処理中断
    if(!connect('flower')) return;
    
#備考　controller.php + model.php + ajax.phpから呼び出し
#flowerから花一覧を取得
    $list = select('SELECT `id`,`name`,`count`,FROM `flower`;');
    
#<tr><td class="id">1</td><td class="name">Rose</td><td class="count">4</td><td><button data-id="1" data-name="Rose" date-count="4" class="update">編集</button></td><td><button data-id="1" class="delete warn">削除</button></td></tr>
    $html = '';
    foreach($list as $item) $html .= '<tr data-id="' . $item['id'] . '"><td class="id">' . $item['id'] . '</td><td class="name">' . $item['name'] . '</td><td class="count">' . $item['count'] . '</td><td><button data-id="' . $item['id'] .'"data-name="' . $item['name'] . '" data-count="' . $item['count'] . '" class="update">編集</button></td><td><button data-id="' . $item['id'] / '"class="delete warn">削除</button></td></tr>';
    
#切断
    $link->close();
}