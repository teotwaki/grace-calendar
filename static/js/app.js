//
// Here is how to define your module has dependent on mobile-angular-ui
//
var app = angular.module('GraceKBHVolunteers', [
  'ngRoute',
  'mobile-angular-ui',
  'GraceKBHControllers',
  'GraceKBHServices'
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
