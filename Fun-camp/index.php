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
    <!-- database header出力 -->
    <?php
    require_once 'database.php';
    include 'header.php'; 
    ?>
    
    <!-- Slide image -->
    <!-- JavaScriptで表示 -->
    <img src="images/camp-001.jpg" id="slide_img" class="slider"/>
    

    <main>
        
    </main>

   
    <!-- footer.php出力 -->
    <?php include 'footer.php'; ?>
