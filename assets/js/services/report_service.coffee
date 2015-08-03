angular.module('services', ['ngResource', 'auth'])

  .factory 'Report', ($resource) ->
    $resource 'report'

