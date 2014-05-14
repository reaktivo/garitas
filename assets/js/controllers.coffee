#= require bower_components/underscore/underscore

{ pick } = _

angular.module 'controllers', ['services', 'auth']

  .controller 'MainController', ($scope, Facebook) ->
    $scope.ports = ['San Ysidro', 'Otay Mesa', 'Tecate']
    $scope.login = Facebook.login

  .controller 'PortController', ($scope, Port) ->
    $scope.laneTypes = Port.query { port: $scope.portName }

  .controller 'LaneController', ($scope, Report) ->
    $scope.switchMode = ->
      $scope.reportMode = not $scope.reportMode
      if $scope.reportMode
        $scope.report = new Report(pick $scope.lane, 'port', 'type', 'lane', 'delay')

  .controller 'UserReportController', ($scope, Report) ->

    $scope.minDelay = 0
    $scope.maxDelay = 600

    $scope.submit = ->
      $scope.report.$save()

    $scope.cancel = ->
      $scope.switchMode()

    $scope.add = ->
      $scope.report.delay += 10
      if $scope.report.delay > $scope.maxDelay
        $scope.report.delay = $scope.maxDelay

    $scope.subtract = ->
      $scope.report.delay -= 10
      if $scope.report.delay < $scope.minDelay
        $scope.report.delay = $scope.minDelay

