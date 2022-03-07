phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2022-02-05 08:17:28
-- サーバのバージョン： 10.4.22-MariaDB
-- PHP のバージョン: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+09:00";


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

DROP TABLE `categories`;
CREATE TABLE `categories` (
  `id` smallint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `parent_id` smallint UNSIGNED DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `link` VARCHAR(255) DEFAULT NULL
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

DROP TABLE `products`;
CREATE TABLE `products` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `product_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_catchcopy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_Images` text DEFAULT NULL,
  `product_URL` text NOT NULL,
  `product_category_id` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_catchcopy`, `product_Images`, `product_URL`, `product_category_id`) VALUES
(1, 'キャノピーテント(4-5人用) 山善 YAMAZEN キャンパーズコレクション ', '　広くて快適なプロモキャノピードームテント 送料無料', 'https://thumbnail.image.rakuten.co.jp/@0_mall/e-kurashi/cabinet/main-img/010/main-59584.jpg?_ex=128x128', 'https://ite', 1),
(2, 'ワンタッチテント  ', '雑誌Biginで紹介されました 【1年保証】 ドーム型テント キャンピングテント ビーチテント キャンプ用品 四人用 三人用 uv uv加工 紫外線防止 日よけ 日除け 耐水 撥水 ペグ ロープ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/dondon/cabinet/lxt02_4.jpg?_ex=128x128', 'https://ite', 1),
(3, 'ドームテント 大型 6人用 FIELDOOR ', '追加でシートセットも！大型テント 300cm×300cm 3m 大型 組み立て式 キャノピーテント ドームテント 4人 - 6人 キャノピーポール付 ワンタッチ スクリーンテント と合わせて広々リビング', 'https://thumbnail.image.rakuten.co.jp/@0_mall/maxshare/cabinet/master/1st/a13380.jpg?_ex=128x128', 'https://ite', 1),
(4, '【1年保証】おすすめ アウトドア テント ファミリー ファミリーキャンプテント4人用 大型テント 簡単 組立 フルクローズ テント 5人 おしゃれ リビングスペース キャンプ UV シルバーコーティング 防水 レジャー ad176 防災 避難用 おうちキャンプ ベランピング', '＼ファミリーキャンプにオススメ／送料無料 テント フルクローズ 設置 簡単 4人 5人 240x445x175cm　ad176', 'https://thumbnail.image.rakuten.co.jp/@0_mall/alice-zk/cabinet/ad/ad176.jpg?_ex=128x128', 'https://ite', 1),
(5, '1年保証 テント ワンタッチ 4人用 5人用 ワンタッチテント UVカット 大型 ヘキサゴン テント 耐水圧 1,500mm以上 ドームテント キャンプテント ファミリー キャンプ用品 アウトドア セット 簡易テント 軽量 日よけ キャンプ FIELDOOR ■[送料無料][あす楽]', '選べるグランドシートセットも！シリーズ累計2万台販売！組立時間15秒！ワンタッチテント 2人 3人 4人 5人 高品質 ヘキサゴン型 運動会 ビーチ 日よけ 雨よけ プール BBQ 野外 フェス', 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile88/cabinet/master/1st/a05113.jpg?_ex=128x128', 'https://ite', 1),
(6, 'EU限定モデル！ Coleman(コールマン)Darwin 3 PLUS ダーウィン 3 プラス ツーリングテント ドームテント キャンプ 2〜3人用 設営簡単 日本未発売', 'EU コールマン 人気のテントです！', 'https://thumbnail.image.rakuten.co.jp/@0_mall/yms--online/cabinet/coleman/free_1626081898834.jpg?_ex=128x128', 'https://ite', 1),
(7, '☆2/4~2/6 3%OFFCP【送料無料】おすすめ アウトドア テント オールインワン キャンプ 防水 キャンピングテント ドームテント 本格派 てんと ファミリーテント 寝泊り アウトドア インナーテント 通風口 テント ad176', '最安値挑戦中！ キャンプにおすすめ！オールインワンテント 防災用品 限定商品♪', 'https://thumbnail.image.rakuten.co.jp/@0_mall/ashop/cabinet/ad/ad176.jpg?_ex=128x128', 'https://ite', 1),
(8, '【Bears Rock】 広々大空間 家族にうれしい 大型テント ワンタッチテント フルクローズ 6人用 ビッグベアーテント ドームテント フライシート 防水 アウトドア キャンプ 防災 アウトドア用品 キャンプ用品 5人用 5〜6人用ドーム型 ワンタッチ テント AXL-601', '雨風に強いフルクローズのワンタッチテント!', 'https://thumbnail.image.rakuten.co.jp/@0_mall/gorilla55/cabinet/outdoor/02973283/bigbeartent/bigbear-tent_top.jpg?_ex=128x128', 'https://ite', 1),
(9, '【2/4 15%OFFCP】【1年保証】おすすめ アウトドア テント ファミリー ワンタッチテント ファミリーキャンプテント4人用 フルクローズ キャンプ 庭 ベランダ 5人 おしゃれ 簡単 組み立て レジャー 行楽 海水浴 運動会 公園 ad078 防災 避難用 おうちキャンプ ベランピング', '＼ファミリーキャンプにオススメ／送料無料 テント かんたん ワンタッチテント 大型 ポップアップテント 4人 5人310×240×145cm ad078', 'https://thumbnail.image.rakuten.co.jp/@0_mall/alice-zk/cabinet/ad/ad078.jpg?_ex=128x128', 'https://ite', 1),
(10, '【最大2,000円OFFクーポン発行中】【2年保証】 テント ワンタッチテント 3-4人用 サンシェードテント キャンプテント ビーチテント ポップアップテント 簡易テント 運動会 公園 砂浜 防災用 登山用 着替え 日よけ 収納袋付き ペグ付き txz-0094l', 'ワンタッチテント 簡単設営 UVカット 防風防水 キャンプ 海 登山 紫外線防止 コンパクト収納 折りたたみ ファミリー 3窓 かわいい おしゃれ 室内 3人用 2人用 着替え 日よけ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/luckpanda/cabinet/sozai/goods/txz-0094l-1c.jpg?_ex=128x128', 'https://ite', 1),
(11, '1年保証 テント ワンタッチ 3人用 4人用 ワンタッチテント UVカット スクエア テント 耐水圧 1,500mm以上 ドームテント キャンプテント ファミリー キャンプ用品 アウトドア セット 簡易テント 軽量 日よけ キャンプ FIELDOOR ■[送料無料][あす楽]', '選べるフライシート・グランドシートセットも！シリーズ累計2万台販売！組立時間15秒！ワンタッチテント 2人 3人 4人 200 x 200cm 高品質 スクエア型 運動会 ビーチ 日よけ 雨よけ プール', 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile88/cabinet/master/1st/a05112.jpg?_ex=128x128', 'https://ite', 1),
(12, '【1年保証】 ワンタッチテント フルクローズ 4人用 3人用 テント ワンタッチ おしゃれ ドームテント 折りたたみ 簡易テント 簡易 簡単 軽量 uvカット 紫外線 メッシュ 防水 キャンプ アウトドア レジャー バーベキュー ベランピング', '雑誌Biginで紹介されました 【1年保証】 ドーム型テント キャンピングテント ビーチテント キャンプ用品 四人用 三人用 uv uv加工 紫外線防止 日よけ 日除け 耐水 撥水 ペグ ロープ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/kagulabo/cabinet/cart/lxt02_th_1.jpg?_ex=128x128', 'https://ite', 1),
(13, '【Bears Rock】 ツーリングテント 登山 1〜2人用 コンパクト ツーリング 幅 長さ 45cm ドームテント ワンタッチテント テント 山登り ソロキャンプ 1人用 2人用 ハヤブサテント はやぶさ 一人用 二人用 ソロテント 自立 防災 おうち キャンプ テント', '設営5分。耐風性、耐水性に優れたコンパクト2人用サイズ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/gorilla55/cabinet/outdoor/02973283/05508773/hayabusa-tent-top.jpg?_ex=128x128', 'https://ite', 1),
(14, '☆2/4~2/6 3%OFFCP【送料無料】おすすめ アウトドア テント 2人用 3人用 ツールーム 耐水圧 2000mm 部屋 リビング スクリーン ドームテント キャンプ アウトドア レジャー ひさし フライシート付き 防虫 フルクローズ イエロー/ホワイト ad056', '最安値挑戦中！ キャンプにおすすめ！ツールームテント 限定商品♪', 'https://thumbnail.image.rakuten.co.jp/@0_mall/ashop/cabinet/ad/ad056.jpg?_ex=128x128', 'https://ite', 1),
(15, '【2/4 15%OFFCP】【1年保証】おすすめ アウトドア テント ワンタッチテント ポップアップテント ファミリーキャンプテント4人用 3人 海 小型 ビーチテント コンパクト フルクローズ メッシュ アウトドア 公園 行楽 運動会 ad103 防災 避難用 おうちキャンプ ベランピング', '＼ファミリーキャンプにオススメ／送料無料 ワンタッチ ビーチテント キャンプ テント 3人 4人 幅200cm×奥行150cm×高さ130cm ad103', 'https://thumbnail.image.rakuten.co.jp/@0_mall/alice-zk/cabinet/ad/ad103.jpg?_ex=128x128', 'https://ite', 1),
(16, 'タイムセール★限定 w470『ワンタッチテント』 2020 テント ワンタッチ 4人用 3人用 キャンプテント キャンプ用品 アウトドア 防災グッズ 傘 簡易テント 簡単テント かんたんテント おしゃれ 軽量 ドームテント 日よけ キャンプ 夏 フェス 登山 着替え 庭 ガーデニング', '組立時間15秒！ワンタッチテント 高品質 スクエア型 運動会 ビーチ 日よけ 雨よけ プール BBQ 野外 フェス', 'https://thumbnail.image.rakuten.co.jp/@0_gold/userlife/images2020/timesale/tent_timesale_thumb.jpg?_ex=128x128', 'https://ite', 1),
(17, '◆4H限定!クーポンで全品5%OFF◆ サイドシート1枚付 3m ワンタッチ タープテント 風に強い ベンチレーション 収納バッグ UV 耐水 タープ テント ワンタッチ テント サイドシート セット キャンプ アウトドア レジャー グリーン グレー ネイビー ベージュ おしゃれ', 'ワンタッチ タープテント 3m サイドシート 1枚付 ベンチレーション UV カット 耐水 ワンタッチタープ タープ テント 簡単 収納ケース BBQ キャンプ アウトドア 大型 おしゃれ endlessbase', 'https://thumbnail.image.rakuten.co.jp/@0_mall/ease-space/cabinet/04094751/04914930/19000014_100.jpg?_ex=128x128', 'https://ite', 1),
(18, '☆2/4~2/6 3%OFFCP【送料無料】おすすめ アウトドア テント キャンプ ドーム 5人用 簡単設営 ワンタッチテント てんと 大型 組み立て 簡単 アウトドア レジャー 天窓 スポーツ 登山 ワンタッチ テント オーカー/ネイビー/コーヒー ad078', '最安値挑戦中！ キャンプにおすすめ！ドーム型テント 防災にも 限定商品♪', 'https://thumbnail.image.rakuten.co.jp/@0_mall/ashop/cabinet/ad/ad078.jpg?_ex=128x128', 'https://ite', 1),
(19, '【SALE特価7,700円2/14PM3時まで】テント 4人用 ドームテント UVカット ドーム型 耐水圧 1,500mm以上 シルバーコーティング メッシュ フルクローズテント テント キャノピー キャノピーテント インナーテント 簡易テント キャンプドーム キャンプ ●[送料無料]', '追加でテントポール・シートセットも！ 収納 キャリーバッグ 付き 簡単設営 テント アウトドア スポーツ キャンプ用品 キャンプ 登山 海水浴 着替え ビーチテント ツーリング ドライブ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/happy11/cabinet/master/sale_0214/a11621.jpg?_ex=128x128', 'https://ite', 1),
(20, '2人用ドームテント 組立式 キャンプ ツーリングテント アウトドア HAC 送料無料', '組立簡単!コンパクト収納で持ち運びにも便利な軽量仕様♪アウトドアはもちろん非常用、緊急時にも！', 'https://thumbnail.image.rakuten.co.jp/@0_mall/shimakobo/cabinet/sports/hac2325-2.jpg?_ex=128x128', 'https://ite', 1),
(21, '【365日保証】 テント キャンプ ドーム 5人用 ワンタッチ フルクローズ おしゃれ かわいい ポップアップテント 大型 組み立て 簡単 アウトドア レジャー 日よけ 日除け 日差し対策 天窓 イベント スポーツ 公園 登山 屋外 ad078', 'テント キャンプ ドーム 5人用 簡単設営 ワンタッチテント', 'https://thumbnail.image.rakuten.co.jp/@0_mall/patri/cabinet/ad/ad078.jpg?_ex=128x128', 'https://ite', 1),
(22, '【365日保証】 蚊帳テント キャンプ テント アウトドア 日よけ 雨よけ 大型 タープ 簡単組立 4面 フルクローズ スクリーンタープ スクリーンテント ドームテント キャノピー 虫よけ メッシュ 夏 レジャー イベント ad249', '通気性ばつぐん！ 蚊帳テント 3m', 'https://thumbnail.image.rakuten.co.jp/@0_mall/patri/cabinet/ad/ad249.jpg?_ex=128x128', 'https://ite', 1),
(23, '1年保証 テント 2-4人用 ワンタッチ ワンタッチテント ポップアップテント 200cm 2人 3人 4人 フルクローズ テント フルクローズ UVカット ビーチテント サンシェード サンシェードテント 日よけキャンプ ワンタッチ 簡易 コンパクト 軽量 FIELDOOR ■[送料無料][あす楽]', '追加料金でシートセット 累計11万個超販売！ワンタッチテント ポップアップテント 簡易テント 運動会 海 登山 バーベキュー BBQ 野外 夏 フェス イベント 日よけ プール 着替え 花火', 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile88/cabinet/master/1st/a09177.jpg?_ex=128x128', 'https://ite', 1),
(24, 'コールマン 2021年新作 ツーリングドームLX 2000038142 キャンプ ドームテント ツーリングテント 2人用 3人用 Coleman', '', 'https://thumbnail.image.rakuten.co.jp/@0_mall/alpen/cabinet/img/295/7005103401_7.jpg?_ex=128x128', 'https://ite', 1),
(25, '【10%OFFクーポン配布中】テント 一人用 コンパクト ソロテント キャンプ テント ドームテント ドーム型テント キャンピングテント アウトドアテント 簡易テント 防災用テント 大型テント 2人用 防水 登山 アウトドア 防災グッズ キャンプ用品 送料無料 R10P', '雨の日でも安心！防水仕様 アウトドア、キャンプにオススメ！災害などの緊急時にも使える！ ★コンパクトテント 人気 2人用 収納バッグ付き', 'https://thumbnail.image.rakuten.co.jp/@0_mall/weiwei/cabinet/shouhin-image02/odtt2or.jpg?_ex=128x128', 'https://ite', 1),
(26, '1年保証 テント ワンタッチ 一人用 2人用 ワンタッチテント 150 × 200 耐水 遮熱 UVカット スクエア テント 耐水圧 1,500mm以上 ドームテント キャンプテント キャンプ用品 アウトドア 簡易テント 軽量 コンパクト FIELDOOR ■[送料無料][あす楽]', '選べるグランドシートセットも！シリーズ累計2万台販売！組立時間15秒！ワンタッチテント 一人 二人 150cm x 200cm 日よけ ドームテント ソロテント アウトドア キャンプ用品 キャンプ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile88/cabinet/master/1st/a16856.jpg?_ex=128x128', 'https://ite', 1),
(27, 'テント 2人用 冬 キャンプ 簡単 着替え 軽量 室内 大人 災害 防災 ワカサギ ドーム型 組み立て式 アウトドア レジャー ツーリング 収納バッグ付き おすすめ ソロ 快適 1人用 自立式 組立簡単 ツーリング 釣り 防災 ビーチ 防雨 簡易 日よけ 虫よけ 避難 災害 イベント 公園', 'ポール2本の簡単構造なので1人でも短時間で設営できます。フルオープン・メッシュクローズ・フルクローズの切替えができるのでシーンに合わせて開閉可能。', 'https://thumbnail.image.rakuten.co.jp/@0_mall/nichicommerce/cabinet/item/outdoor/imgrc0092828908.jpg?_ex=128x128', 'https://ite', 1),
(28, '1年保証 テント ワンタッチ 大型 4人用 5人用 6人用 ワンタッチテント UVカット キャノピー ポール 付 耐水圧 1,500mm以上 ドームテント フルクローズテント キャンプテント スクリーンテント メッシュ アウトドア キャンプ グランピング FIELDOOR ■[送料無料][あす楽]', '追加でシートセットも！ 300cm×300cm 大型 簡単ワンタッチ設営 ドームテント 4人-6人 キャノピーポール付 ワンタッチスクリーンテントと合わせて広々リビング アウトドア 日よけ 日除け', 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile88/cabinet/master/1st/a16078.jpg?_ex=128x128', 'https://ite', 1),
(29, 'KODIAK CANVAS 6人用 Flex-Bow VX グランドシート付 コディアック キャンバス カンバス テント コットンテント アウトドア キャンプ 防水 ファミリー 家族 大型 国内正規品', '全米で一番売れているコットンテント！', 'https://thumbnail.image.rakuten.co.jp/@0_mall/aquitania/cabinet/06088290/06268455/imgrc0077829829.jpg?_ex=128x128', 'https://ite', 1),
(30, '【365日保証】 テント ワンタッチテント 4人 5人 ビーチテント キャンプ かわいい おしゃれ 組立簡単 ポップアップテント uvカット 軽量 フルクローズ 蚊帳 簡易 ドーム 日よけ 日除け 日差し対策 公園 od285', 'ファミリー向け 4〜5人用 ワンタッチテント', 'https://thumbnail.image.rakuten.co.jp/@0_mall/patri/cabinet/o/od285.jpg?_ex=128x128', 'https://ite', 1),
(31, '【楽天ランキング1位獲得】ベアボーンズ リビング Barebones Living レイルロード ランタン LED Railroad Lantern アウトドア キャンプ ランプ', 'ベアボーンズリビング LEDランタン ライト 照明 キャンプ 充電式 調光機能 おしゃれ かわいい LEDライト アンティーク レトロ 野外 照明 災害 防災', 'https://thumbnail.image.rakuten.co.jp/@0_mall/glv/cabinet/newsingle202108/brs-94.jpg?_ex=128x128', 'https://ite', 1),
(32, '【ふるさと納税】【令和4年5月以降発送予定】HAKUBA VALLEY OTARI｜オフロードや段差もスムーズに移動ができて収納時はコンパクト　アウトドアワゴン　キャンプ', '容量約92L、耐荷重約60kg。極太タイヤで、オフロードや段差もスムーズに移動ができるアウトドアワゴン。', 'https://thumbnail.image.rakuten.co.jp/@0_gold/f204862-otari/cmn/images/hakubavalley_wagon_catchv02.jpg?_ex=128x128', 'https://ite', 1),
(33, '【4時間限定！350円OFFクーポン♪4日23:59迄】寝袋 シュラフ 洗える コンパクト 冬用 軽量 防災 寝袋 マット 封筒型軽量 連結 防寒 大人 登山 キャンプ レジャー 布団 アウトドア 車中泊 防災 節電 春 秋 冬 防災台風対策 防災グッズ 冬 来客 用', 'キャンプ だけじゃもったいない！お家でもいつでもあったかスタイル♪ 節電 対策にもピッタリの シュラフ です！', 'https://thumbnail.image.rakuten.co.jp/@0_mall/auc-risecreation/cabinet/product/top/c034_01_navy_ri_em.jpg?_ex=128x128', 'https://ite', 1),
(34, '【ふるさと納税】【令和4年1月中旬以降発送】HAKUBA VALLEY OTARI｜テーブルの天板を丸めて収納できる、ロールトップテーブル　キャンプ　アウトドア　90cm×60cm', 'コンパクトに収納できるので、アウトドアシーンで大活躍必須です。', 'https://thumbnail.image.rakuten.co.jp/@0_gold/f204862-otari/cmn/images/hakubavalley_table90_catch.jpg?_ex=128x128', 'https://ite', 1),
(35, 'HAWK GEAR(ホークギア) 寝袋 シュラフ マミー型 キャンプ アウトドア -15度耐寒 ソロキャン 簡易防水 オールシーズン コンパクト', '-15度耐寒 マミー型 寝袋 洗える コンパクト シュラフ キャンプ アウトドア -15度耐寒 ソロキャン 防水加工済 オールシーズン', 'https://thumbnail.image.rakuten.co.jp/@0_mall/selectshoptks/cabinet/07894859/01.jpg?_ex=128x128', 'https://ite', 1),
(36, '＼2/4 20時から4時間限定 30%クーポン／【楽天1位★2冠達成】 キャンプ テーブル 〈S字フック4個付〉 無限連結可能 耐荷重40kg 耐熱200度 折りたたみ 組立簡単 軽量 コンパクト アウトドア テーブル ローテーブル キャンプテーブル アウトドアテーブル ソロキャンプ', '＼ランタンポール・S字フックかけ・連結用天板を使えばもっと便利に快適に！／ 折り畳み式テーブル フィールドラック BBQ ピクニック 送料無料 【GUAPO グアポ】', 'https://thumbnail.image.rakuten.co.jp/@0_mall/guapo/cabinet/camp/0203ct30.jpg?_ex=128x128', 'https://ite', 1),
(37, '全品20%OFFクーポン配布中★4日0:00-23:59 ◆楽天ランキング4冠受賞◆ 【EVOKE公式】 キャンプ コット 2way キャンプベッド アウトドアベッド 折りたたみ ベッド キャンプ用ベッド フォールディングコット 折り畳み 軽量 ワイド コンパクト', 'アウトドアをもっと楽しく、おしゃれに! アウトドア キャンプ コット', 'https://thumbnail.image.rakuten.co.jp/@0_mall/tts-in-nagoya/cabinet/item/08604710/cot_000.jpg?_ex=128x128', 'https://ite', 1),
(38, '【楽天1位★累計27万脚突破】アウトドアチェア キャンプ椅子 キャンプチェア 軽量 折りたたみ椅子 アウトドア チェア コンパクト ローチェア おしゃれ キャンプ 椅子 イス 携帯 チェアー 送料無料 / ウルトラライトフィットチェア ロータイプ 超軽量 ポンコタンチェア', '＼2021ver.／「小さい 軽い 気持ちいい」シーンを選ばず 持ち運び いつでもどこでも大活躍 : 軽い ポータブル ハンモック アルミ 軽量チェア アウトドアチェアー キャンプ用品 :', 'https://thumbnail.image.rakuten.co.jp/@0_gold/poncotan/sum/123w-fc-raku.jpg?_ex=128x128', 'https://ite', 1),
(39, '【開始4時間10％OFFクーポン発行中！】 【楽天1位】クッカー クッカーセット ソロキャンプ アルミ製 鍋 フライパン ケトル 3点セット 軽量 コンパクト 収納袋 キャンプ 登山 釣り アウトドア キャンプ飯 やかん キャンプ用品 キャンプギア 防災用品 防災グッズ BBQ 送料無料', 'ソロキャンプにピッタリの軽量コンパクトなクッカーセット！アルマイトコーティングの 鍋/フライパン/ケトル 豪華3点セット！！', 'https://thumbnail.image.rakuten.co.jp/@0_mall/hobbyone/cabinet/mainpic01/_4589886136653-5.jpg?_ex=128x128', 'https://ite', 1),
(40, '【10％offクーポン対象】【高評価★楽天ランキング1位】 焚き火台 コンパクト ソロ キャンプ バーベキューコンロ 焚火台 折りたたみ式 たきび台 焚き火 グリル 軽量 ステンレス ミニ焚き火台 五徳 アウトドア ファイアースタンド カマド 薪ストーブ ファイアーグリル', 'あす楽 ソロキャンパー 大勢のキャンプでも おすすめ 持ち運び便利な収納ケース付き！ たきび台 コンパクト焚き火台 コンロ ソロキャンプ 組立簡単 ケース付 1人用 2人用 家族 BBQ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/mystic-r/cabinet/event/coupon/imgrc0074077345.jpg?_ex=128x128', 'https://ite', 1),
(41, '【2/4 20:00〜2/5 23:59】3000円OFFクーポン イグニオ 2ルーム トンネル型 ドームテント IG19410TT キャンプ ドームテント 大型 4人用 IGNIO', '', 'https://thumbnail.image.rakuten.co.jp/@0_mall/alpen/cabinet/220203/30000_1/7005040501_19.jpg?_ex=128x128', 'https://ite', 1),
(42, '【お買い物マラソン 5%OFF】アウトドアワゴン キャリーカート キャリーワゴン 耐荷重150kg 折りたたみ 大型タイヤ 大容量 110L 4輪 th14', 'あす楽 悪路走行可能 ワンタッチ式 キャンプ レジャー スポーツ 運動会 お花見', 'https://thumbnail.image.rakuten.co.jp/@0_mall/dabada/cabinet/06047777/imgrc0079698973.jpg?_ex=128x128', 'https://ite', 1),
(43, '【最大2,000円OFFクーポン発行中】キャンプライト 2個セット LEDライト ランタン 充電式 モバイルバッテリー 懐中電灯 アウトドア ライト 超軽量 持ち運び簡単 防水 キャンプ用品 防災 地震対策 ピクニック 3つ調光モード USB充電式 磁石 マグネット txz yd2', '2個セット キャンプライト ランタン led 充電式 LEDキャンプライト 海水浴 コンパクト キャンパーズ 人気 防災 防災グッズ 避難 登山用 便利 ピクニック バーベキュウ 照明ライト', 'https://thumbnail.image.rakuten.co.jp/@0_mall/fancywonderland/cabinet/items/goods/yd2_1.jpg?_ex=128x128', 'https://ite', 1),
(44, '【ふるさと納税】【令和4年5月以降発送予定】雨飾高原キャンプ場オリジナルホットサンドクッカー', 'キャンプでもお家でも。お手軽・簡単・おいしい、AMAKAZARI CAMP FIELD ホットサンドクッカー', 'https://thumbnail.image.rakuten.co.jp/@0_mall/f204862-otari/cabinet/05486398/07915360/hotsand_catch.jpg?_ex=128x128', 'https://ite', 1),
(45, '驚異の明るさ1,000ルーメン！充電式 LED ランタン LEDライト 防災グッズ キャンプ用品 LED ランタン アウトドア スマートフォンにも充電できる モバイルバッテリー LAD WEATHER ラドウェザー 送料無料 あす楽', '超高輝度 1,000ルーメン！LEDランタン。電池がいらない充電式、式選べる点灯モード。キャンプ・暗所・夜釣り等で活躍。災害への備えにも！', 'https://thumbnail.image.rakuten.co.jp/@0_gold/vanilla-vague/images/thumb/ledmaster005-thum-740-001.jpg?_ex=128x128', 'https://ite', 1),
(46, '【楽天1位★累計27万脚突破】アウトドアチェア キャンプ椅子 キャンプチェア 軽量 折りたたみ椅子 アウトドア チェア コンパクト アルミ キャンプ おしゃれ 椅子 イス 携帯 チェアー 送料無料 / ウルトラライト フィットチェア ハイバック 超軽量 ポンコタンチェア', '「小さい 軽い 気持ちいい」ハイバックチェア シーンを選ばず大人気 持ち運び簡単 いつでもどこでも大活躍 : 軽い ポータブル ハンモック 軽量チェア キャンプ用品 :', 'https://thumbnail.image.rakuten.co.jp/@0_gold/poncotan/sum/123w-hbhf-sum.jpg?_ex=128x128', 'https://ite', 1),
(47, '木製3段ラック A3R-01 ウッドラック 木製ラック 折りたたみ キャンプ アウトドア バーベキュー BBQ キャンプ用品 山善 YAMAZEN キャンパーズコレクション 【送料無料】', '　天然木の風合いが魅力の木製ラック 送料無料', 'https://thumbnail.image.rakuten.co.jp/@0_mall/e-kurashi/cabinet/main-img/002/main-26567.jpg?_ex=128x128', 'https://ite', 1),
(48, '【ふるさと納税】断熱防水ピクニックサーモマット195×155cm(LOGOS LAND)71809732【1132363】', 'どんな地面でも快適に過ごせる!断熱防水ピクニックサーモマットです。', 'https://thumbnail.image.rakuten.co.jp/@0_mall/f262072-joyo/cabinet/lp/71809732_s.jpg?_ex=128x128', 'https://ite', 1),
(49, '【お買い物マラソンxポイント5倍 02/04 20:00～02/11 01:59】Dellepico 耐火グローブ 耐熱グローブ 耐熱手袋 キャンプ 手袋 キャンプグローブ 革手袋 作業用手袋 防寒手袋 キャンプ キャンプ用品 アウトドア 2カラー 23~24cm 作業用 BBQ バーベキュ 焚火 焚き火', '送料無料！2カラー！ 耐熱グローブ 本牛革　', 'https://thumbnail.image.rakuten.co.jp/@0_mall/kom-kom/cabinet/glove/2.jpg?_ex=128x128', 'https://ite', 1),
(50, 'Naturehike ハンガーラック ランタンスタンド 物干しフック付 アルミ合金 折り畳み 組み立て 簡単 超軽量 収納便利 ファミリーキャンプ 室内 アウトドア スポーツキャンプ', '新版 軽量ハンガーラック ランタンスタンド 物干しフッ', 'https://thumbnail.image.rakuten.co.jp/@0_mall/westcity520/cabinet/07382210/outdoor-01-1.jpg?_ex=128x128', 'https://ite', 1),
(51, '【タイムセール／圧倒的高評価！】ファイヤースターター ナイフ アウトドア 救急セット 火吹き棒 ホイッスル 日本製絆創膏付 ポイント消化 サバイバル BBQ アウトドア用品 キャンプグッズ キャンプ用品 伸縮式 メタルマッチ ソロキャンプ 携帯用 焚火 バーベキュー', '楽天ランキング1位ありがとうございます！ ナイフまでついた豪華6点セット！ソロキャンプ 初心者にも！', 'https://thumbnail.image.rakuten.co.jp/@0_mall/scandinavie/cabinet/06829617/imgrc0089546639.jpg?_ex=128x128', 'https://ite', 1),
(52, '「2点セット」「8.5cm 幅広厚手」エアーマット 8.5cm 車中泊マット エアーベッド キャンプマット 折り畳み 枕付き キャンピングマット 足踏み式 アウトドアマット キャンプ 軽量 無限連結可能 防水防潮 防災 40Dナイロン+TPU生地 収納袋付き', 'エアーマット シングルサイズ 無限連結可能 防水防潮 キャンプマット 折り畳み 枕付き 足踏み式', 'https://thumbnail.image.rakuten.co.jp/@0_mall/la-ma/cabinet/a/a100215-set.jpg?_ex=128x128', 'https://ite', 1),
(53, '【マラソン中P20倍！】【圧倒的高評価レビュー4.5点！】 WAQ キャンプマット 8cm 自動膨張式 連結 インフレータブル 車中泊マット waq-m8 【1年保証】', 'WAQ キャンプ マット 8CM 車中泊 マット 自動膨張 連結 インフレータブルマット アウトドア', 'https://thumbnail.image.rakuten.co.jp/@0_mall/waqoutdoor/cabinet/tent/cartimg/m8-1_cart.jpg?_ex=128x128', 'https://ite', 1),
(54, 'キャノピーテント(4-5人用) CPR-5UV ドームテント テント タープ キャンプ アウトドア おしゃれ 人気 日よけ サンシェード 4人用 5人用 山善 YAMAZEN キャンパーズコレクション 【送料無料】', '　 広くて快適なプロモキャノピードームテント 送料無料', 'https://thumbnail.image.rakuten.co.jp/@0_mall/kagustyle/cabinet/main-img/010/main-59584.jpg?_ex=128x128', 'https://ite', 1),
(55, '【ふるさと納税】コッパーシェラカップ500　【雑貨・日用品・アウトドア・キャンプ】　お届け：寄付入金確認後、翌月上旬頃よりの発送', '【長野県駒ヶ根市】', 'https://thumbnail.image.rakuten.co.jp/@0_mall/f202100-komagane/cabinet/56591144_01_web_s.jpg?_ex=128x128', 'https://ite', 1),
(56, 'ShineTrip ハンギングラック ランタンスタンド 物干しフック付 ハンガーラック アルミ合金 折り畳み 組み立て 簡単 超軽量 収納便利 ファミリーキャンプ 室内 アウトドア スポーツキャンプ', '軽量ハンギングラック ランタンスタンド 物干しフック付', 'https://thumbnail.image.rakuten.co.jp/@0_mall/westcity520/cabinet/07382210/1111.jpg?_ex=128x128', 'https://ite', 1),
(57, '【ふるさと納税】[村の鍛冶屋] 鍛造ペグ（エリッゼステーク）8本セット キャンプ用品 アウトドア用品【012P031】', '', 'https://thumbnail.image.rakuten.co.jp/@0_mall/f152048-sanjo/cabinet/product/01_2/imgrc0089768100.jpg?_ex=128x128', 'https://ite', 1),
(58, '[Civil Life]トライポッド 焚火三脚 焚き火スタンド アルミ製 【ブラック/シルバー】 キャンピング ミニ コンパクト コンパクト収納 アウトドア トライアングル キャンプ バーベキュー レジャー コンロ 焚き火料理 ランタン 福袋 2022 初売り', '【選べる2色】コンパクト収納式バーベキュー用　トライポッド コンロ トライアングル アウトドア 焚き火 料理 キャンプ ファイアスタン', 'https://thumbnail.image.rakuten.co.jp/@0_mall/civil-life/cabinet/goods/j-0630-1-1.jpg?_ex=128x128', 'https://ite', 1),
(59, 'アウトドア カトラリー 3点セット ｜ スプーン フォーク 箸 食器セット カトラリーセット キャンプ 折畳式 コンパクト収納 食器 シングル ステンレス はし つなぎ箸 収納袋 デイキャンプ バーベキュー お弁当 ピクニック ファミリーキャンプ レジャー 清潔 丈夫 長持ち エコ', 'ソロキャンプ BBQ コンロ 便利 おしゃれ 人気 一人用 初心者 まとめて収納 持ち運びに最適 ステンレス製 食事 料理 アウトドアクッキング 登山', 'https://thumbnail.image.rakuten.co.jp/@0_mall/lovely-d/cabinet/m-2008-003-01.jpg?_ex=128x128', 'https://ite', 1),
(60, '「当店限定色あり！」ブルーノ LEDランタン BRUNO LED LANTERN ライト 電灯 灯り 電池式 15灯 照度調節機能 持ち手付き インテリア テント ギフト プレゼント 雑貨 防災 BBQ キャンプ アウトドア ピクニック おしゃピク 別注カラー 【正規品】', '＜2021 秋冬＞', 'https://thumbnail.image.rakuten.co.jp/@0_mall/canpanera/cabinet/item106/item_b06019_0.jpg?_ex=128x128', 'https://ite', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

DROP TABLE `reviews`;
CREATE TABLE `reviews` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `review_comment` text NOT NULL,
  `review_date` timestamp DEFAULT CURRENT_TIMESTAMP,
  `review_product_id` mediumint UNSIGNED NOT NULL,
  `review_user_id` mediumint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `reviews`
--

INSERT INTO `reviews` (`id`, `review_comment`, `review_date`, `review_product_id`, `review_user_id`) VALUES
(2, 'aaaaa', '2022-02-05 15:39:13', 1, 2),
(3, 'kkkkk', '2022-02-05 15:42:22', 1, 2),
(4, 'llll', '2022-02-05 15:42:36', 1, 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

DROP TABLE `users`;
CREATE TABLE `users` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'naruse', 'naruse.yukari.0317@gmail.com', '$2y$10$OMaZ61B4et3yvuRbwWB7x.d.7Aae2r5bAv5q8LYWJcY4Ip8W.M7bC'),
(2, 'SAMURAI', 'aaa@gmail.com', '$2y$10$XU/kfcwj8l4utUULrVU14OdQ1G5sccocZdIPLrKbjZxdzkWqzU8oO');

--
-- ダンプしたテーブルのインデックス
--

ALTER TABLE `products` ADD KEY `cat01` (`product_category_id`);

--
-- テーブルのインデックス `reviews`
--
ALTER TABLE `reviews` ADD KEY `review01` (`review_product_id`), ADD KEY `review02` (`review_user_id`);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `products`
--
ALTER TABLE `products` ADD CONSTRAINT `cat01` FOREIGN KEY (`product_category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
ALTER TABLE `reviews` ADD CONSTRAINT `review01` FOREIGN KEY (`review_product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;
ALTER TABLE `reviews` ADD CONSTRAINT `review02` FOREIGN KEY (`review_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;