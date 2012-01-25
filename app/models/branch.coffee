Spine = require 'spine'

class Branch extends Spine.Model
  @configure 'Branch', 'name', 'repo', 'py', 'js'
  @extend Spine.Model.Local

module.exports = Branch
