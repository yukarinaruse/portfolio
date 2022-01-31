<!DOCTYPE html>
<html lang="ja" xmlns:ng="http://angularjs.org" id="ng-app" ng-app="app">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>【サイトのタイトルを入れてね】</title>
<meta name="description" content="【サイトの説明文を入れてね】">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
	.thumbnail {
		height: 400px;
		overflow: hidden;
	}
	
	h3 {
		font-size: 100%;
	}
	
	.price {
		color: #F00;
		font-size: 120%;
		font-weight: bold;
	}
</style>
</head>
<body>

	<div class="container" ng-controller="MainCtrl" ng-cloak>
	
		<h2>テント</h2>

		
		
		<div class="row">
			<div ng-repeat="item in items" class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<a ng-href="{{item.affiliateUrl}}" target="_blank">
						<img ng-src="{{item.mediumImageUrls[0]}}">
					</a>
					<div class="caption">
						<h3>
							<a ng-href="{{item.affiliateUrl}}" target="_blank">{{item.itemName}}</a>
						</h3>
						<div class="price">{{item.itemPrice}}円</div>
						<rating ng-model="item.reviewAverage" max="5"></rating>
						<div class="catchcopy">{{item.catchcopy}}</div>
					</div>
				</div>
			</div>
		</div>
		
		<pagination
			direction-links="true"
			boundary-links="false"
			total-items="totalItems"
			items-per-page="itemsPerPage"
			ng-model="currentPage"
			ng-change="callAPI()"
			previous-text="«"
			next-text="»">
		</pagination>

		<div class="center-block">
			<a href="http://webservice.rakuten.co.jp/" target="_blank">
				<img src="//webservice.rakuten.co.jp/img/credit/200709/credit_22121.gif">
			</a>
		</div>

	</div>


	<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.28/angular.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/angular-i18n/1.2.10/angular-locale_ja-jp.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.12.0/ui-bootstrap-tpls.min.js"></script>

	<script>

		// 楽天API用パラメータ
		var api = 'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706';
		var applicationId = '1084628355096003137';
		var affiliateId = '2388c07c.3b4a440c.2388c07d.42f178c6';
		
		// 検索キーワード
		var keyword = 'キャンプ';
		var genreId = '302373';
		
		

		// 一度に読み込む件数
		var itemsPerPage = 30;

		// PCかスマホかで検索条件を分ける
		var carrier = /android|iphone|ipad|ipod/i.test(navigator.userAgent) ? 2 : 0;

		// 	Angular を起動する
		var app = angular.module('app',['ui.bootstrap']);

		// コントローラ
		app.controller('MainCtrl', function($scope, $http) {

			$scope.currentPage = 1;
			$scope.itemsPerPage = itemsPerPage;

			$scope.callAPI = function() {

				// APIコール用のパラメータ
				var params = {
					applicationId : applicationId,
					affiliateId   : affiliateId,
					hits          : itemsPerPage,
					page          : $scope.currentPage,
					carrier       : carrier,
					formatVersion : 2,
					imageFlag     : 1,
					callback      : 'JSON_CALLBACK',
					format        : 'json',
					sort          : '-reviewAverage',
					keyword       : keyword,
					genreId       : genreId
				};

				// APIをコールする
				$http.jsonp(api, { params: params })
				.success(function(result) {
					$scope.items = result.Items;
					$scope.totalItems = result.count;
				});

			};

			// APIを呼び出す
			$scope.callAPI();
		});

	</script>

</body>
</html>