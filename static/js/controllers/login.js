function LoginCtrl($scope, $auth, $location) {
  $scope.googleLogin = function() {
    $auth.authenticate('google')
      .then(function(response) {
        $scope.loadMenuData();
        $location.path('/#/');
      });
  }

  $scope.fbLogin = function() {
    $auth.authenticate('facebook')
      .then(function(response) {
        $scope.loadMenuData();
        $location.path('/#/');
      });
  }
}

angular
  .module('Grace.LoginCtrl', [])
  .controller('LoginCtrl', LoginCtrl);
