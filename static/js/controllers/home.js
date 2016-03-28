function HomeCtrl($scope, Posts) {
  $scope.page = 0;
  $scope.posts = [];

  $scope.loadMore = function() {
    ++$scope.page;
    var posts = Posts.query({page: $scope.page}, function() {
      $scope.posts = $scope.posts.concat(posts.posts);
      $scope.lastPage = posts.pagination.last_page;
    });
  };

  $scope.loadMore();
}

angular
  .module('Grace.HomeCtrl', ['angularMoment'])
  .controller('HomeCtrl', HomeCtrl);
