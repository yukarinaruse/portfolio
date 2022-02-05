<?php
ob_start();
session_start();
?><!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Fun-camp</title>
	<link rel="icon" type="image/x-icon" href="images/Fun-camp-logo.png">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="styles/main_styles.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="styles/script.js"></script>
</head>
<body>
<?php
require_once 'database.php';
require_once 'header.php';
require_once 'review.php';
require_once 'product.php';
?>



<?php
// 口コミデータをそのデータに紐づくユーザー情報を取得する
$product_id = $_GET['id'];
$reviews_data = fetch_reviews($product_id, $mysqli);

// 口コミがある場合はループ処理を実行する
if ( $reviews_data !== false ) {
	foreach ($reviews_data as $review_data ) {
	?>

	<div class="col-xs-12">
		<h4>
			名前：<?php echo $review_data['user_name']; ?>さん
			（<?php echo $review_data['review_date']; ?>）
		</h4>
		<p><?php echo $review_data['review_comment']; ?></p>
	</div>

	<?php } // End of foreach ?>

<?php } // End of if ?>

<?php
// 口コミの投稿
if ($_POST) {

	// 必須項目に情報が入っているかを確認する
	if ( !empty( $_POST['add_review'] )) {
		$add_review = $_POST['add_review'];
		add_review($product_id, $add_review, $mysqli);
	} else {
		echo "口コミを入力してください";
	}
}
 ?>

<div class="container">
	<div class="row">
		 <div class="col-xs-12">
		 	<h3>口コミを投稿する</h3>
			<form action="" method="post">
				<textarea name="add_review" class="form-control" placeholder="口コミを記入してください。"></textarea>
				<button type="submit" class="btn btn-default">投稿する</button>
			</form>
		 </div>
	</div>
</div>

<?php
include 'footer.php';  