function UserEditCtrl($scope, StoreUser, Users, $window) {
  $scope.currentUser = StoreUser.get();
  $scope.saveUnlocked = false;

  $scope.unlockSave = function() {
    $scope.saveUnlocked = true;
  };

  $scope.saveUser = function() {
    Users.update($scope.currentUser, function() {
      $window.history.back();
    });
  };
}

angular
  .module('Grace.UserEditCtrl', [])
  .controller('UserEditCtrl', UserEditCtrl);
