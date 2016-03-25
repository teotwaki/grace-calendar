//
// Here is how to define your module has dependent on mobile-angular-ui
//
angular
  .module('GraceKBHVolunteers',
          ['ngRoute', 'mobile-angular-ui', 'GraceKBHServices',
           'Grace.MyScheduleCtrl', 'Grace.HomeCtrl', 'Grace.MainCtrl', 'Grace.ComingDaysCtrl'])

//
// You can configure ngRoute as always, but to take advantage of SharedState location
// feature (i.e. close sidebar on backbutton) you should setup 'reloadOnSearch: false'
// in order to avoid unwanted routing.
//
  .config(function($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'pages/home.html',
        controller: 'HomeCtrl',
        reloadOnSearch: false
      })

      .when('/next-week', {
        templateUrl: 'pages/next-week.html',
        controller: 'ComingDaysCtrl',
        reloadOnSearch: false
      })

      .when('/my-schedule', {
        templateUrl: 'pages/my-schedule.html',
        controller: 'MyScheduleCtrl',
        reloadOnSearch: false
      })

      .otherwise('/');
  });
