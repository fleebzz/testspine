Spine = require('spine')
Contact = require('models/contact')
$   = Spine.$

class Show extends Spine.Controller
  className: 'show'
  
  events:
    'click .edit': 'edit'
  
  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/show')(@item)

  change: (params) ->
    @item = Contact.find(params.id)
    @render()

  edit: ->
    @navigate('/contacts', @item.id, 'edit')
    
class Edit extends Spine.Controller
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click .delete': 'delete'

  elements: 
    'form': 'form'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/form')(@item)

  change: (params) =>
    @item = Contact.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate('/contacts', @item.id)

  delete: ->
    @item.destroy() if confirm('Are you sure?')

class Create extends Spine.Controller
  className: 'create'

  events:
    'submit form': 'submit'
    'click .cancel': 'cancel'

  elements: 
    'form': 'form'

  constructor: ->
    super
    @active @render

  render: ->
    @html require('views/form')

  submit: (e) ->
    e.preventDefault()
    @item = new Contact
    @item.fromForm(@form).save()
    @navigate('/contacts', @item.id)

  cancel: ->
    @navigate('/')

class Main extends Spine.Stack
  className: 'main stack'

  controllers:
    show: Show
    edit: Edit
    create: Create

module.exports = Main