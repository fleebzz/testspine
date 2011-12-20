Spine   = require('spine')
Header  = require('models/header')
Manager = require('spine/lib/manager')
$       = Spine.$

Topmenu = require('controllers/topmenu')

class Estredia extends Spine.Controller
  className: 'estredia'
  
  constructor: ->
    super
    
    @topmenu  = new Topmenu
    
    @routes
      '/:id': (params) ->
        @topmenu.active(params)
    
    @append @topmenu

    head = Header.create(name: "MenuItem")
    head.save()
    head = Header.create(name: "MenuItem2")
    head.save()
    
    Header.fetch()
    
module.exports = Estredia