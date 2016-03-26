function MainCtrl($scope, $rootScope, $location) {
  $rootScope.$on('$routeChangeStart', function(){
    // Needed for the loading screen
    $rootScope.loading = true;
    // Needed to hide the left-hand side menu during login
    $rootScope.duringLogin = $location.path() == '/login';
  });

  $rootScope.$on('$routeChangeSuccess', function() {
    // Needed for the loading screen
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
