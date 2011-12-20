Spine = require('spine')

class Content extends Spine.Model
  @configure 'Content', 'name'
  
module.exports = Content