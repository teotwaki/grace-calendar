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
  })

  .factory('StoreUser', function() {
    var savedData = {};

    function set(data) {
      savedData = data;
    }

    function get() {
      return savedData;
    }

    return {
      set: set,
      get: get
    };
  });
