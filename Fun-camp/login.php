<?php
ob_start();
session_start();
 ?>
 <!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Fun-camp</title>
	<link rel="icon" type="image/x-icon" href="images/Fun-camp-logo.png">
	<link rel="stylesheet" href="styles/main_styles.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <script src="styles/script.js"></script>
</head>
<?php
include 'database.php';
include 'header.php';
include 'user.php';
?>

<?php
//  ログインボタンが押された時に下記を実行
if ( $_POST ) {

	// 必須項目に情報が入っているかを確認する
	if (
		!empty( $_POST['user_email']) &&
		!empty( $_POST['user_password'])
	 ) {

		//  エラーがない場合
		$user_email = $_POST['user_email'];
		$user_password = $_POST['user_password'];

		// ログインする
		login_user($user_email, $user_password, $mysqli);
	} else {
		echo "エラーがあります";
	}

}
 ?>
<main>
 <div class="col-xs-6">
 	<h2>ログイン</h2>
	<form action="" method="post">
		<div class="form-group">
			<label for="user_email">Email</label>
			<input type="email" class="form-control" id="user_email" name="user_email">
		</div>
		<div class="form-group">
			<label for="user_password">パスワード</label>
			<input type="password" class="form-control" id="user_password" name="user_password">
		</div>
		<button type="submit" class="btn btn-default">ログイン</button>
	</form>
 </div>
</main>

<?php
include 'footer.php';