angular.module 'controllers', ['services', 'auth']

  .controller 'MainController', ($scope, Facebook) ->
    $scope.ports = [ '250401', '250601', '250501']
    $scope.login = Facebook.login
