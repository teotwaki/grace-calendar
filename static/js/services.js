angular
  .module('GraceKBHServices', ['ngResource'])

  .factory('ComingDays', function($resource) {
    return $resource('/api/coming-days');
  })

  .factory('Posts', function($resource) {
    return $resource('/api/posts', {}, {
      'query': { method: 'GET', isArray: false }
    });
  });
