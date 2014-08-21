secrets = require '../secrets'
{ pick } = require 'underscore'

reportKeys = ['port_id', 'type', 'lane', 'delay']

module.exports = (app) ->

  app.post '/report', (req, res, next) ->
    if req.userId
      report = pick req.body, reportKeys
      report.user_id = req.userId
      app.reporter.add report, (err) ->
        if err
          res.send 400, err
        else
          res.send 200, report
    else
      res.send 401