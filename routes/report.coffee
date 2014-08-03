secrets = require '../secrets'
{ pick } = require 'underscore'

reporter = require('border-reporter')
  connection: 'postgres://localhost:5432/garitas'
  privileged: secrets.PRIVILEGED_USERS

reportKeys = ['port_id', 'type', 'lane', 'delay']

module.exports = (app) ->

  app.post '/report', (req, res, next) ->
    if req.userId
      report = pick req.body, reportKeys
      report.user_id = req.userId
      reporter.add report, (err) ->
        if err
          res.send 400, err
        else
          res.send 200, report
    else
      res.send 401