#= require services/fake
#= require directives/fakes/fake

app = angular.module 'fakeController', ['fakeService', 'fakeRow']

app.controller 'FakeController', ['$scope', 'Fake',
  ($scope, Fake) ->
    $scope.fakes = Fake.all {}
    $scope.removeFake = (fake) ->
      fake.$destroy {}, ->
        $scope.fakes = (b for b in $scope.fakes when b.id isnt fake.id)
]

app.controller 'FakeController', ['$scope', '$routeParams', '$location', 'Fake',
  ($scope, $routeParams, $location, Fake) ->
    $scope.fake = Fake.get id: $routeParams.id, (fake) ->
      $scope.fakeHumanPrice = fake.price / 1000
      $scope.$watch 'fakeHumanPrice', ->
        $scope.fake.price = $scope.fakeHumanPrice * 1000

    $scope.submitFake = ->
      callback = -> $location.path "/"
      if $scope.fake.id?
        $scope.fake.$update {}, callback
      else
        Fake.create $scope.fake, callback
]
