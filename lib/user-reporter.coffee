EventEmitter = require('eventemitter2').EventEmitter2;

class Reporter extends EventEmmiter

  constructor: (publishFn) ->
    @border = new BorderWait

  update: => @border.ports().then @handle


module.exports = (publishFn) -> new Reporter(publishFn)
