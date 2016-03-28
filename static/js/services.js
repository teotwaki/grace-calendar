angular
  .module('GraceKBHServices', ['ngResource'])

  .factory('ComingDays', function($resource) {
    return $resource('/api/coming-days.json');
  });
