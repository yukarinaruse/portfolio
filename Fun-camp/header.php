<?php
$result = $mysqli->query('SELECT `id`,`parent_id`,`name`,`link` FROM `categories` WHERE parent_id IS NULL;');
if(!$result) exit;
$categories = [];
while($row = $result->fetch_assoc()) $categories[] = $row;


# $c : SELECT結果
# $n : 何階層目か
function getHTML($c, $n = 0) {
# 名前
	$u = $c['name'];

# <a href="???">名前</a>
	if(!empty($c['link'])) $u = '<a href="???"' . $c['link'] . '">' . $u . '</a>';

# <li>名前
# <li><a href="???">名前</a>
	$h = '<li>' . $u;

# 子カテゴリがあるか？
global $mysqli;
	$r = $mysqli->query("SELECT `id`,`parent_id`,`name`,`link` FROM `categories` WHERE parent_id={$c['id']};");
	if(!$r) return $h . '</li>';

	$children = [];
	while($row = $r->fetch_assoc()) $children[] = $row;

# 子カテゴリなし
	if(!count($children)) return $h . '</li>';

# 子カテゴリあり
	++$n;
	$ch = '';
	foreach($children as $child) $ch .= getHTML($child, $n);
	return $h . '<ul>' . $ch . '</ul></li>';
}

$html = '';
foreach($categories as $cat) $html .= getHTML($cat);
?><header class="header clearfix">
	<!-- Logo -->
	<div class="logo f-left"><img src="images/Fun-camp-logo.png" width="100" height="90" alt="#"></div>

	<!-- Drop-down menu -->
	<ul class="ddmenu f-right">
		<li><a href="login.php">ログイン</a></li>
		<li><a href="signup.php">会員登録</a></li>
		<?php echo $html; ?>
	</ul>
</header>  
 
