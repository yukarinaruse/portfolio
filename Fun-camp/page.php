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
	
    <script src="styles/script.js"></script>
</head>
<?php
include 'database.php';
include 'header.php';
include 'product.php';
?>

<?php
// 商品一覧データを取得

$products_data = fetch_products($mysqli);
foreach ($products_data as $product_data ) {
?>




<div class="card" >
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><?php echo $product_data['product_name']; ?></h5>
    <p class="card-text"><?php echo $product_data['product_description']; ?></p>
    <a href="detail.php?id=<?php echo $product_data['product_id'] ?>"> 口コミを見る</a>
  </div>
</div>
<?php  } // End of foreach ?>
<?php
include 'footer.php';