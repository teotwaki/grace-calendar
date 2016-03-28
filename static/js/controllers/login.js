function LoginCtrl($scope, $auth) {
  $scope.googleLogin = function() {
    $auth.authenticate('google')
      .then(function(response) {
        console.log(response.data);
      })
      .catch(function(response) {
        console.log(response.data);
      });
  }

  $scope.fbLogin = function() {
    $auth.authenticate('facebook')
      .then(function(response) {
        console.log(response.data);
      })
      .catch(function(response) {
        console.log(response.data);
      });
  }
}

angular
  .module('Grace.LoginCtrl', [])
  .controller('LoginCtrl', LoginCtrl);
