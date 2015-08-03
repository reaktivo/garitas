#= require bower_components/underscore/underscore

{ pick } = _

reportKeys = ['port_id', 'port', 'crossing', 'type', 'lane', 'delay']

angular.module 'controllers', ['services', 'auth']

  .controller 'LaneController', ($scope, Report) ->

    $scope.switchMode = (mode) ->
      return $scope.login() unless $scope.user
      mode = not $scope.reportMode if mode is undefined
      $scope.reportMode = mode
      if mode and $scope.report is undefined
        $scope.report = new Report(pick $scope.lane, reportKeys)