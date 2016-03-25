function ComingDaysCtrl($scope, ComingDays) {
  // Next 7 days, returned by the server
  $scope.coming_days = ComingDays.query();
}

angular
  .module('Grace.ComingDaysCtrl', [])
  .controller('ComingDaysCtrl', ComingDaysCtrl);
