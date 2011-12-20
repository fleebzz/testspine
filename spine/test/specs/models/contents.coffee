describe 'Contents', ->
  Contents = null
  
  beforeEach ->
    class Contents extends Spine.Model
      @configure 'Contents'
  
  it 'can noop', ->
    