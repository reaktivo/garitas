#= require facebook

class Main

  constructor: ->
    @facebook = new Facebook(window.locals.FB_APP_ID)

jQuery(document).ready ->
  window.app = new Main()