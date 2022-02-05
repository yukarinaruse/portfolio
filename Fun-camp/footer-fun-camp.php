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

<!-- header.php出力 -->
<?php include 'header.php'; ?>


<body>
    <div class="about">
        <img src="images/camp-007.jpg" />
            <p>Fun-campとは<br>みんなで作る、キャンプを楽しむためのサイトです</p>
    </div>
</body>
</html>