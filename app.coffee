{ join } = require 'path'

express = require 'express'

# Required middleware
logger = require 'morgan'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'
serve = require 'serve-static'
load = require 'express-load'
cookie = require 'cookie-parser'
assets = require 'connect-assets'

# Configuration
app = module.exports = express()
app.set 'port', process.env.PORT or 3000
app.set 'views', join(__dirname, 'views')
app.set 'view engine', 'jade'

# Setup middleware
app.use serve join __dirname, 'public'
app.use serve join __dirname, 'assets'
app.use logger('dev')
app.use assets(helperContext: app.locals)
app.use cookie()
app.use bodyParser()
app.use methodOverride()

load 'locals'
  .then 'routes'
  .into app

# Find port to listen to, then listen
app.listen app.get 'port'
console.log "Listening on port #{app.get('port')} : #{app.settings.env}"