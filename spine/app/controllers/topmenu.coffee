Spine   = require('spine')
Header = require('models/header')
List    = require('spine/lib/list')
$       = Spine.$

class Topmenu extends Spine.Controller
  className: 'topmenu'
    
  elements:
    '.topmenuitems': 'topmenuitems'
    'input': 'search'
    
  constructor: ->
    super
    @html require('views/topmenu')()
    
    @list = new List
      el: @topmenuitems, 
      template: require('views/topmenuitem'), 
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Header.find(params.id))
    
    Header.bind('refresh change', @render)
    
  render: =>
    headers = Header.all()
    @list.render(headers)
    
  change: (topmenuitem) =>
    console.log "I clicked"
    @navigate '/', topmenuitem.id
    
module.exports = Topmenu