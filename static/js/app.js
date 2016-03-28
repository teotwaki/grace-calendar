//
// Here is how to define your module has dependent on mobile-angular-ui
//
angular
  .module('GraceKBHVolunteers',
          ['ngRoute', 'mobile-angular-ui', 'GraceKBHServices', 'satellizer',
           'Grace.MyScheduleCtrl', 'Grace.HomeCtrl', 'Grace.MainCtrl', 'Grace.ComingDaysCtrl', 'Grace.LoginCtrl'])

//
// You can configure ngRoute as always, but to take advantage of SharedState location
// feature (i.e. close sidebar on backbutton) you should setup 'reloadOnSearch: false'
// in order to avoid unwanted routing.
//
  .config(function($routeProvider, $authProvider) {
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

      .when('/login', {
        templateUrl: 'pages/login.html',
        controller: 'LoginCtrl',
        reloadOnSearch: false
      })

      .otherwise('/');

    $authProvider.facebook({
      clientId: 'foobar'
    });

    $authProvider.google({
      clientId: '1055680974535-jfku1jmeokoahn5cflr1q55ekn7ou67t.apps.googleusercontent.com'
    });
  })

  .filter('newlines', function() {
    return function(text) {
      return text.split(/\n/g);
    };
  });
