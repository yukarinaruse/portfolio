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
include 'header.php';
?>

<div class="card-group">

<?php
// 商品一覧データを取得
require_once 'product.php';
$products_data = fetch_products($mysqli);
foreach($products_data as $product_data) {
?>


  <div class="card">
    <img src="" class="card-img-top" alt="<?php echo $product_data['product_Images']; ?>">
    <div class="card-body">
      <h5 class="card-title"><?php echo $product_data['product_name']; ?></h5>
      <p class="card-text"><?php echo $product_data['product_catchcopy']; ?></p>
    </div>
	
    <div class="card-footer">
		<a href="<?php echo $product_data['product_URL']; ?>">楽天ページへ</a>
		<a href="detail.php<?php echo $product_data['product_id']; ?>">口コミを見る</a>
    </div>
  </div>

  






<?php
} // End of foreach
?>
</div>
<?php
include 'footer.php';
?>

</body>
</html> 