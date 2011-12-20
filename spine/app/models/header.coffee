Spine = require('spine')

class Header extends Spine.Model
  @configure 'Header', 'name'

  @extend Spine.Model.Local

  @filter: (query) ->
    return @all()
  
module.exports = Header