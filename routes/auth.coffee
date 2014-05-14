{ parse } = require 'signed-request'

module.exports = (app) ->
  { app_id, app_secret } = app.locals.facebook

  app.all '*', (req, res, next) ->
    signed = req.cookies["fbsr_#{app_id}"]
    if signed then try
      req.auth = parse signed, app_secret, 0
      req.userId = req.auth.user_id
    next()