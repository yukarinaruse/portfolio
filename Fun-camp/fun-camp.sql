-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2022-02-04 10:09:52
-- サーバのバージョン： 10.4.21-MariaDB
-- PHP のバージョン: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `fun-camp`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `parent_id` smallint(5) UNSIGNED DEFAULT NULL,
  `name` tinytext NOT NULL,
  `link` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `link`) VALUES
(1, NULL, 'カテゴリー', NULL),
(2, NULL, 'レイアウト', NULL),
(3, NULL, 'キャンプ場', NULL),
(4, NULL, '予約', NULL),
(5, 1, '道具', NULL),
(6, 1, '料理', NULL),
(7, 2, '季節ごと', NULL),
(8, 2, 'ファミリー', 'family'),
(9, 2, 'ソロ', 'solo'),
(10, 2, 'グループ', 'group'),
(11, 3, '全国から探す', NULL),
(12, 4, 'なっぷ', 'https://www.nap-camp.com/'),
(13, 5, 'テント・タープ', '???'),
(14, 5, '寝具', '???'),
(15, 5, 'ランタン・ライト', '???'),
(16, 5, 'クッカー', '???'),
(17, 5, 'テーブル', '???'),
(18, 5, 'ＤＩＹ', '???'),
(19, 5, 'etc...', '???'),
(20, 6, '初心者', '???'),
(21, 6, 'ファミリー', '???'),
(22, 6, 'ソロ', '???'),
(23, 6, 'グループ', '???'),
(24, 6, 'etc...', '???'),
(25, 7, '春', '???'),
(26, 7, '夏', '???'),
(27, 7, '秋', '???'),
(28, 7, '冬', '???'),
(29, 11, '北海道', '???'),
(30, 11, '青森県', '???'),
(31, 11, '岩手県', '???'),
(32, 11, '宮城県', '???'),
(33, 11, '秋田県', '???'),
(34, 11, '山形県', '???'),
(35, 11, '福島県', '???'),
(36, 11, '茨城県', '???'),
(37, 11, '栃木県', '???'),
(38, 11, '群馬県', '???'),
(39, 11, '埼玉県', '???'),
(40, 11, '千葉県', '???'),
(41, 11, '東京都', '???'),
(42, 11, '神奈川県', '???'),
(43, 11, '新潟県', '???'),
(44, 11, '富山県', '???'),
(45, 11, '石川県', '???'),
(46, 11, '福井県', '???'),
(47, 11, '山梨県', '???'),
(48, 11, '長野県', '???'),
(49, 11, '岐阜県', '???'),
(50, 11, '静岡県', '???'),
(51, 11, '愛知県', '???'),
(52, 11, '三重県', '???'),
(53, 11, '滋賀県', '???'),
(54, 11, '京都府', '???'),
(55, 11, '大阪府', '???'),
(56, 11, '兵庫県', '???'),
(57, 11, '奈良県', '???'),
(58, 11, '和歌山県', '???'),
(59, 11, '鳥取県', '???'),
(60, 11, '島根県', '???'),
(61, 11, '岡山県', '???'),
(62, 11, '広島県', '???'),
(63, 11, '山口県', '???'),
(64, 11, '徳島県', '???'),
(65, 11, '香川県', '???'),
(66, 11, '愛媛県', '???'),
(67, 11, '高知県', '???'),
(68, 11, '福岡県', '???'),
(69, 11, '佐賀県', '???'),
(70, 11, '長崎県', '???'),
(71, 11, '熊本県', '???'),
(72, 11, '大分県', '???'),
(73, 11, '宮崎県', '???'),
(74, 11, '鹿児島県', '???'),
(75, 11, '沖縄県', '???');

-- --------------------------------------------------------

--
-- テーブルの構造 `products`
--

CREATE TABLE `products` (
  `product_id` int(8) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_catchcopy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_Images` blob DEFAULT NULL,
  `product_URL` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_cat` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(8) NOT NULL,
  `review_comment` text NOT NULL,
  `review_date` datetime NOT NULL,
  `review_product_id` int(8) NOT NULL,
  `review_user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `user_id` int(8) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(0, 'naruseyukari', 'naruse.yukari.0317@gmail.com', '$2y$10$1gwWldgLI9FgXojmql2nA.FhWeQuDRMadq8SPXnJZRurECDKGkWci');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `products`
--
ALTER TABLE `products`
  ADD KEY `product_id` (`product_id`);

--
-- テーブルのインデックス `reviews`
--
ALTER TABLE `reviews`
  ADD KEY `review_user_id` (`review_user_id`),
  ADD KEY `review_product_id` (`review_product_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD KEY `user_id` (`user_id`);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `review01` FOREIGN KEY (`review_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review02` FOREIGN KEY (`review_user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
