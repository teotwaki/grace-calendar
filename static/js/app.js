//
// Here is how to define your module has dependent on mobile-angular-ui
//
var app = angular.module('GraceKBHVolunteers', [
  'ngRoute',
  'mobile-angular-ui',
]);

//
// You can configure ngRoute as always, but to take advantage of SharedState location
// feature (i.e. close sidebar on backbutton) you should setup 'reloadOnSearch: false'
// in order to avoid unwanted routing.
//
app.config(function($routeProvider) {
  $routeProvider.when('/',              {templateUrl: 'pages/home.html', reloadOnSearch: false});
  $routeProvider.when('/next-week',     {templateUrl: 'pages/next-week.html', reloadOnSearch: false});
  $routeProvider.when('/my-schedule',   {templateUrl: 'pages/my-schedule.html', reloadOnSearch: false});
});

//
// For this trivial app we have just a unique MainController for everything
//
app.controller('MainController', function($rootScope, $scope){
  // Needed for the loading screen
  $rootScope.$on('$routeChangeStart', function(){
    $rootScope.loading = true;
  });

  $rootScope.$on('$routeChangeSuccess', function(){
    $rootScope.loading = false;
  });

  // Fake text i used here and there.
  $scope.lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel explicabo, aliquid eaque soluta nihil eligendi adipisci error, illum corrupti nam fuga omnis quod quaerat mollitia expedita impedit dolores ipsam. Obcaecati.';
});
