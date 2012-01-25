Spine = require 'spine'

class Repo extends Spine.Model
  @configure "Repo", "ref", "branches", "is_main"
  @extend Spine.Model.Local

module.exports = Repo
