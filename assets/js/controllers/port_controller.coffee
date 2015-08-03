angular.module 'controllers', ['services', 'auth']

  .controller 'PortController', ($scope, Port) ->
    $scope.laneTypes = Port.query { port_id: $scope.port_id }
