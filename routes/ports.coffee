_ = require 'underscore'
{ where } = _

module.exports = (app) ->

  app.get '/ports', (req, res, next) ->
    foundReports = where app.reporter.reports(), { port_id: req.query.port_id }
    res.send foundReports