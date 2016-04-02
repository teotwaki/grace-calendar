function UserEditCtrl($scope, StoreUser) {
  $scope.currentUser = StoreUser.get();
  $scope.saveUnlocked = false;

  $scope.unlockSave = function() {
    $scope.saveUnlocked = true;
  };
}

angular
  .module('Grace.UserEditCtrl', [])
  .controller('UserEditCtrl', UserEditCtrl);
