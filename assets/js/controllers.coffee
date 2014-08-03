#= require bower_components/underscore/underscore

{ pick } = _

reportKeys = ['port_id', 'port', 'crossing', 'type', 'lane', 'delay']

angular.module 'controllers', ['services', 'auth']

  .controller 'MainController', ($scope, Facebook) ->
    $scope.ports = [ '250401', '250601', '250501']
    $scope.login = Facebook.login

  .controller 'PortController', ($scope, Port) ->
    $scope.laneTypes = Port.query { port_id: $scope.port_id }

  .controller 'LaneController', ($scope, Report) ->

    $scope.switchMode = (mode) ->
      return $scope.login() unless $scope.user
      mode = not $scope.reportMode if mode is undefined
      $scope.reportMode = mode
      if mode and $scope.report is undefined
        $scope.report = new Report(pick $scope.lane, reportKeys)

  .controller 'UserReportController', ($scope, Report) ->

    $scope.minDelay = 0
    $scope.maxDelay = 600

    $scope.submit = ->
      $scope.report.$save()

    $scope.add = ->
      $scope.report.delay += 10
      if $scope.report.delay > $scope.maxDelay
        $scope.report.delay = $scope.maxDelay

    $scope.subtract = ->
      $scope.report.delay -= 10
      if $scope.report.delay < $scope.minDelay
        $scope.report.delay = $scope.minDelay

