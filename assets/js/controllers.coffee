angular.module 'controllers', ['services']

  .controller 'ReportController', ($scope) ->
    $scope.ports = ['San Ysidro', 'Otay Mesa', 'Tecate']

  .controller 'PortController', ($scope, Port) ->
    $scope.laneTypes = Port.query { port: $scope.portName }