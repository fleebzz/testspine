require('lib/setup')

Spine = require('spine')
Estredia = require('controllers/estredia')

class App extends Spine.Controller
  constructor: ->
    super
    @estredia = new Estredia
    @append @estredia.active()

    Spine.Route.setup()

module.exports = App