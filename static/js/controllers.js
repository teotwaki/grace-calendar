angular.module('GraceKBHControllers', [])

//
// For this trivial app we have just a unique MainController for everything
//
.controller('MainController', function($rootScope, $scope, ComingDays){
  // Needed for the loading screen
  $rootScope.$on('$routeChangeStart', function(){
    $rootScope.loading = true;
  });

  $rootScope.$on('$routeChangeSuccess', function(){
    $rootScope.loading = false;
  });

  // Fake text i used here and there.
  $scope.lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel explicabo, aliquid eaque soluta nihil eligendi adipisci error, illum corrupti nam fuga omnis quod quaerat mollitia expedita impedit dolores ipsam. Obcaecati.';

  // Next 7 days, returned by the server
  $scope.coming_days = ComingDays.query();
});
