describe 'Contact', ->
  Contact = null
  
  beforeEach ->
    class Contact extends Spine.Model
      @configure 'Contact'
  
  it 'can noop', ->
    