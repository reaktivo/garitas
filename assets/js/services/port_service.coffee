#= require bower_components/underscore/underscore

{ groupBy } = _

transformResponse = (ports) ->
  ports = JSON.parse ports
  port = ports[0].port
  groupBy(ports, 'type').map (lanes, name) ->
    { lanes, name, port }

angular.module('services', ['ngResource', 'auth'])

  .factory 'Port', ($resource) ->
    actions = query: { transformResponse, isArray: yes }
    $resource 'ports', {}, actions
