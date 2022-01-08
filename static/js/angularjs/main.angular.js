var integrityApp = angular.module('mbApp', [
	'ngCookies'
])

.config(['$httpProvider', '$qProvider', '$interpolateProvider', function($httpProvider, $qProvider, $interpolateProvider){
	$interpolateProvider.startSymbol('{[').endSymbol(']}');
  	$httpProvider.defaults.headers.post['Content-Type'] = 'application/json';
  	$httpProvider.defaults.xsrfCookieName = 'csrftoken';
	$httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
	$qProvider.errorOnUnhandledRejections(false);
}])

.run(['$http', '$cookies', function($http, $cookies) {
	$http.defaults.headers.common['X-CSRFToken'] = $cookies.csrftoken;
}]);
