{ join } = require 'path'

express = require 'express'

# Required middleware
logger = require 'morgan'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'
serve = require 'serve-static'
load = require 'express-load'
assets = require 'connect-assets'

# Configuration
app = module.exports = express()
app.set 'port', process.env.PORT or 3000
app.set 'views', join(__dirname, 'views')
app.set 'view engine', 'jade'

# Setup middleware
app.use serve join __dirname, 'public'
app.use '/bower', serve join __dirname, 'bower_components'
app.use logger('dev')
app.use bodyParser()
app.use methodOverride()
app.use assets(helperContext: app.locals)

load 'routes'
  .then 'locals'
  .into app

# Find port to listen to, then listen
app.listen app.get 'port'
console.log "Listening on port #{app.get('port')} : #{app.settings.env}"