#= require bower_components/underscore/underscore

{ values, groupBy, map } = _

transformResponse = (ports) ->
  ports = JSON.parse ports
  map groupBy(ports, 'type'), (lanes, name) ->
    { lanes, name }

angular.module('services', ['ngResource', 'auth'])

  .factory 'Port', ($resource) ->
    params = { port: 'defaults' }
    actions = query: { transformResponse, isArray: yes }
    $resource 'ports/:port', params, actions

  .factory 'Report', ($resource) ->
    $resource 'report'

