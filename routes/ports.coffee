BorderWait = require 'border-wait'
border = new BorderWait()
_ = require 'underscore'
{ where, pluck, groupBy } = _
reports = []


update = ->
  border.ports().then (reps) ->
    reports = reps

do update

module.exports = (app) ->
  app.locals.reports = reports

  app.get '/ports/:port', (req, res, next) ->
    foundReports = where reports, { port: req.params.port }
    res.send foundReports