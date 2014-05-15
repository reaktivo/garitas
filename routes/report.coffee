secrets = require '../secrets'
{ extend } = require 'underscore'

reporter = require('border-reporter')
  connection: 'postgres://localhost:5432/garitas'
  privileged: secrets.PRIVILEGED_USERS

module.exports = (app) ->

  app.post '/report', (req, res, next) ->
    if req.userId
      report = extend req.body, userId: req.userId
      reporter.add report, (err) ->
        if err
          res.send 400, err
        else
          res.send 200, report
    else
      res.send 401