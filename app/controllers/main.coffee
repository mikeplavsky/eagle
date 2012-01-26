Spine = require 'spine'

Repo = require 'models/repo'
Branch = require 'models/branch'

class MainBranch extends Spine.Controller

  className: "main_code"

  constructor: ->
    super

    repo = Repo.findByAttribute "is_main", true
    item = Branch.findByAttribute "repo", repo.ref

    @html require( 'views/main_branch' )( item )

class MainRepo extends Spine.Controller

  className: "main_repo"

  constructor: -> 
    super

    item = Repo.findByAttribute "is_main", true
    @html require( 'views/main_repo' )( item )
    
    @append new MainBranch

    Repo.fetch()
    Branch.fetch()


module.exports = MainRepo
