#= require bower_components/underscore.string/lib/underscore.string.js

pad = (str) ->
  _.str.pad str, 2, '0'

angular.module 'filters', []

  .filter 'minutesToTime', ->
    (minutes) ->
      hours = pad Math.floor(minutes / 60)
      minutes = pad minutes % 60
      "#{hours}:#{minutes}"

  .filter 'minutesToDelay', ->
    (minutes) ->
      if minutes > 120
        'slow'
      else if minutes > 60
        'regular'
      else
        'fast'
