#= require templates/books/row_fake

app = angular.module 'fakeRow', ['templates']

app.directive 'fakeRow', ->
  {
    restrict: 'A'
    scope:
      book: '='
      removeBook: '&removefake'
    templateUrl: 'books/row_fake.html'
    controller: ($scope) ->
  }
