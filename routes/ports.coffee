border = require 'border-wait'
_ = require 'underscore'
{ where } = _
reports = []

update = ->
  border.ports().then (reps) ->
    reports = reps
    setTimeout update, 2 * 60000
do update

module.exports = (app) ->
  app.locals.reports = reports

  app.get '/ports', (req, res, next) ->
    foundReports = where reports, { port_id: req.query.port_id }
    res.send foundReports