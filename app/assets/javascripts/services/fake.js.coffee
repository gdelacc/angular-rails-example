app = angular.module 'bookfake', ['ngResource']

app.factory 'Fake', ['$resource',
  ($resource) ->
    $resource 'http://jsonplaceholder.typicode.com/posts', {id: '@id'},
      all:
        isArray: true
      update:
        method: 'PUT'
        transformRequest: (object) -> # incapsulate the object inside the book param
          angular.toJson fake: object
      destroy:
        method: 'DELETE'
        transformRequest: (object) -> # no payload in a destroy request
      create:
        method: 'POST'
        transformRequest: (object) -> # incapsulate the object inside the book param
          angular.toJson fake: object
]