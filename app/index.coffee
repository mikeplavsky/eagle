require 'lib/setup'

Spine = require 'spine'
Main = require 'controllers/main'

demo = ->
  
  Repo = require 'models/repo'
  Branch = require 'models/branch'

  delete_all = (model) ->

    model.deleteAll()
    model.saveLocal()

  delete_all Repo
  delete_all Branch

  create_repo = (data) ->

    repo = new Repo
      ref: data[0]
      branches: data[1]
      is_main: data[2]

    repo.save()

  create_branch = (data)->

    branch = new Branch
      name: data[0]
      repo: data[1]
      py: data[2]
      js: data[3]

    branch.save()

  repos = [
      ["git@github.com:GitEagle/Next.git", ["master"], true ]
      ["git@github.com:WizardEagle/Next.git", ["master", "css-fix", "next-ui"], false]
      ["git@github.com:HunterEagle/Next.git", ["master", "export-pdf", "fix-rotate"], false]
      ["git@github.com:CaissaEagle/Next.git", ["master", "cr9678", "check-js"], false]
      ["git@github.com:WarriorEagle/Next.git", ["master", "delay-splash", "perform-cr8765"], false]
  ]

  branches = [
    ["master", "git@github.com:GitEagle/Next.git", 3.5, 5.1]
    ["master", "git@github.com:WizardEagle/Next.git", 4.5, 5.5]
    ["css-fix", "git@github.com:WizardEagle/Next.git", 7.5, 5.5]
    ["next-ui", "git@github.com:WizardEagle/Next.git", 4.5, 5.5]
    ["master", "git@github.com:HunterEagle/Next.git", 2.5, 5.1]
    ["export-pdf", "git@github.com:HunterEagle/Next.git", 2.5, 5.1]
    ["fix-rotate", "git@github.com:HunterEagle/Next.git", 2.5, 5.1]
    ["master", "git@github.com:CaissaEagle/Next.git", 3.9, 7.1]
    ["master", "git@github.com:WarriorEagle/Next.git", 4.9, 5.1]
  ]

  create_repo x for x in repos
  create_branch x for x in branches

  Repo.saveLocal()
  

class App extends Spine.Controller
  constructor: ->
    super
    demo()

    @main = new Main()

module.exports = App
    
