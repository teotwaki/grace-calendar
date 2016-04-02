function MainCtrl($scope, $rootScope, $location, $auth) {
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

  $scope.loadMenuData = function() {
    $scope.isAuthenticated = $auth.isAuthenticated();
    $scope.isAdmin = $scope.isAuthenticated ? $auth.getPayload().isAdmin : false;
  };

  $scope.loadMenuData();

  $scope.logout = function() {
    $auth.logout();
    $scope.loadMenuData();
    $location.path('/#/');
  }

  // Fake text i used here and there.
  $scope.lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel explicabo, aliquid eaque soluta nihil eligendi adipisci error, illum corrupti nam fuga omnis quod quaerat mollitia expedita impedit dolores ipsam. Obcaecati.';
}

angular
  .module('Grace.MainCtrl', [])
  .controller('MainCtrl', MainCtrl);
