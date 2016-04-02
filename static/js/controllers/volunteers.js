function VolunteersCtrl($scope, Users) {
  $scope.filterNewVolunteers = true;

  $scope.loadMore = function() {
    ++$scope.page;
    var params = {page: $scope.page};

    if ($scope.filterNewVolunteers) {
      params.approved = false;
    }

    var users = Users.query(params, function() {
      $scope.users = $scope.users.concat(users.users);
      $scope.lastPage = users.pagination.last_page;
      $scope.loading = false;
    });
  };

  $scope.resetPagination = function() {
    $scope.page = 0;
    $scope.lastPage = false;
    $scope.loading = true;
    $scope.users = [];
    $scope.loadMore();
  };

  $scope.resetPagination();

  $scope.showFiltered = function() {
    if ($scope.filterNewVolunteers) return;
    $scope.filterNewVolunteers = true;
    $scope.resetPagination();
  };

  $scope.showAll = function() {
    if (!$scope.filterNewVolunteers) return;
    $scope.filterNewVolunteers = false;
    $scope.resetPagination();
  };
}

angular
  .module('Grace.VolunteersCtrl', [])
  .controller('VolunteersCtrl', VolunteersCtrl);
