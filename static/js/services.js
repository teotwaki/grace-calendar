angular
  .module('GraceKBHServices', ['ngResource'])

  .factory('ComingDays', function($resource) {
    return $resource('/api/coming-days');
  })

  .factory('Posts', function($resource) {
    return $resource('/api/posts', {}, {
      'query': { method: 'GET', isArray: false }
    });
  })

  .factory('Users', function($resource) {
    return $resource('/api/users', {}, {
      'query': { method: 'GET', isArray: false }
    });
  });
