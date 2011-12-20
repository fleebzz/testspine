describe 'App.mainmenu', ->
  App.mainmenu = null
  
  beforeEach ->
    class App.mainmenu extends Spine.Controller
  
  it 'can noop', ->
    