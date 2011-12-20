describe 'Headers', ->
  Headers = null
  
  beforeEach ->
    class Headers extends Spine.Model
      @configure 'Headers'
  
  it 'can noop', ->
    