Spine   = require('spine')
Header  = require('models/header')
List    = require('spine/lib/list')
$       = Spine.$

class Topmenu extends Spine.Controller
  className: 'topmenu'
    
  elements:
    '.topmenuitems': 'items'
  
  constructor: ->
    super
    @html require('views/topmenu')()
    @list = new List
      el: @items,
      template: require('views/topmenuitem')
      # selectFirst: true
    
    @list.bind 'change', @change
    
    @active (params) -> 
      console.log "toto"
      @list.change(Header.find(params.id))
    
    Header.bind('refresh change', @render)
  
  render: =>
    heads = Header.all()
    @list.render(heads)
  
  change: (item) =>
    alert "ok"
    @navigate '/', item.id
  
module.exports = Topmenu