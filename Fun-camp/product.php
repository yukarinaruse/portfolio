<?php
function fetch_products($mysqli) {
// productsのDBを選択する
	 $query = "SELECT
					`product_id`,
					`product_name`,
					`product_catchcopy`,
					`product_Images`,
					`product_URL`,
					`product_cat`
				FROM
					`products`";

	$result = $mysqli->query($query);
	if(!$result) {
// エラーが発生した場合
		exit;
	} else {
// カテゴリーが存在しない場合
		if(mysqli_num_rows($result) == 0) {
			exit;
		} else {
// エラーがない場合
// 連想配列にデータを格納する
			$products_data = [];
			while($row = $result->fetch_assoc()) {
				$products_data[] = $row;
			}
			return $products_data;
		}
	}
}
// 口コミを投稿する
function add_review($product_id, $add_review, $mysqli) {
	$product_id = $mysqli->real_escape_string($product_id);
	$add_review = $mysqli->real_escape_string($add_review);
	$user_id = $_SESSION['user'];

	$query = "INSERT INTO
					reviews(
						review_comment,
						review_date,
						review_product_id,
						review_user_id
					)
				VALUES (
					'$add_review',
					NOW(),
					$product_id,
					$user_id
				)";
echo $query;
	$result = $mysqli->query($query);

	if(!$result) {
		echo 'エラーが発生しました。';
	} else {
		echo "口コミを投稿しました。";
	}

} 