Spine   = require('spine')
Contact = require('models/contact')
List    = require('spine/lib/list')
$       = Spine.$

class Sidebar extends Spine.Controller
  className: 'sidebar'

  elements:
    '.items': 'items'
    'input' : 'search'

  events:
    'keyup input': 'filter'
    'click footer .newContact': 'create'
    'click footer .deleteAll': 'deleteAll'

  constructor: ->
    super
    @html require('views/sidebar')()

    @list = new List
      el: @items, 
      template: require('views/item'), 
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Contact.find(params.id))

    Contact.bind('refresh change', @render)

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    contacts = Contact.filter(@query)
    @list.render(contacts)

  change: (item) =>
    @navigate '/contacts', item.id

  create: ->
    @navigate('/contacts', 'create')

  deleteAll: ->
    items = Contact.all()
    item.destroy() for item in items if confirm('Are you sure?')

module.exports = Sidebar