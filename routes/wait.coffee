BorderWait = require 'border-wait'
border = new BorderWait()
_ = require 'underscore'
{ where, pluck, groupBy } = _
reports = []


update = ->
  border.ports().then (reps) ->
    console.log 'Updated reports'
    console.log pluck reps, 'updated_at'
    reports = reps

do update

module.exports = (app) ->
  app.locals.reports = reports

  app.get '/:port', (req, res, next) ->
    foundReports = where reports, { port: req.params.port }
    if foundReports.length is 0
      do next
    else
      res.send groupBy foundReports, 'port'