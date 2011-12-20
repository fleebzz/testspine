describe 'Mainmenu', ->
  Mainmenu = null
  
  beforeEach ->
    class Mainmenu extends Spine.Model
      @configure 'Mainmenu'
  
  it 'can noop', ->
    