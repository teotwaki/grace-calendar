function MainCtrl($scope, $rootScope, $route, $location) {
  // Needed for the loading screen
  $rootScope.$on('$routeChangeStart', function(event, current, previous, rejection){
    $rootScope.loading = true;
    $rootScope.duringLogin = $location.path() == '/login'
  });

  $rootScope.$on('$routeChangeSuccess', function(event, current, previous, rejection){
    $rootScope.loading = false;
  });

  // Authentication stubs
  $scope.isAuthenticated = function() {
    return false;
  };

  $scope.isAdmin = function() {
    return false;
  };

  // Fake text i used here and there.
  $scope.lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel explicabo, aliquid eaque soluta nihil eligendi adipisci error, illum corrupti nam fuga omnis quod quaerat mollitia expedita impedit dolores ipsam. Obcaecati.';
}

angular
  .module('Grace.MainCtrl', [])
  .controller('MainCtrl', MainCtrl);
