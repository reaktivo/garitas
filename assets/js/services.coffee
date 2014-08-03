#= require bower_components/underscore/underscore

{ values, groupBy, map } = _

transformResponse = (ports) ->
  ports = JSON.parse ports
  port = ports[0].port
  map groupBy(ports, 'type'), (lanes, name) ->
    { lanes, name, port }

angular.module('services', ['ngResource', 'auth'])

  .factory 'Port', ($resource) ->
    actions = query: { transformResponse, isArray: yes }
    $resource 'ports', {}, actions

  .factory 'Report', ($resource) ->
    $resource 'report'

