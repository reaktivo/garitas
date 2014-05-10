

module.exports = (app) ->

  app.post '/report', (req, res, next) ->
    res.send 'POSTED REPORT'