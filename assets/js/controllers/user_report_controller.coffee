angular.module 'controllers', ['services', 'auth']

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
