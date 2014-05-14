{ extend } = require 'underscore'

BorderReporter = require('border-reporter')
reporter = BorderReporter('postgres://localhost:5432/garitas')


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