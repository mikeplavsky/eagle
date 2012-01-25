Spine = require 'spine'

Repo = require 'models/repo'
Branch = require 'models/branch'

class MainRepo extends Spine.Controller

  constructor: -> 
    super

    Repo.fetch()
    Branch.fetch()


module.exports = MainRepo
