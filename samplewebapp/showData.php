<?php
# flowerから花一覧を取得
	$sql = 'SELECT `id`,`name`,`count` FROM `flower`;';
	$list = select($sql);


# 実行したSQLの記録
	execute("INSERT INTO `sqllog` (`sql`) VALUES('" . str_replace("'", "''", $sql) . "');");

# <tr><td class="id">1</td><td class="name">Rose</td><td class="count">4</td><td><button data-id="1" data-name="Rose" data-count="4" class="update">編集</button></td><td><button data-id="1" class="delete warn">削除</button></td></tr>
	$html = '';
	foreach($list as $item) $html .= '<tr data-id="' . $item['id'] . '"><td class="id">' . $item['id'] . '</td><td class="name">' . $item['name'] . '</td><td class="count">' . $item['count'] . '</td><td><button data-id="' . $item['id'] . '" data-name="' . $item['name'] .  '" data-count="' . $item['count'] . '" class="update">編集</button></td><td><button data-id="' . $item['id'] . '" class="delete warn">削除</button></td></tr>';
?>