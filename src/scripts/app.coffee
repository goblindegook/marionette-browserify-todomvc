# Make the App class available right away:
module.exports = class App

Router     = require './router'
Controller = require './controller'
Header     = require './view/header'
Footer     = require './view/footer'
ListView   = require './view/list-view'
TodoList   = require './collection/todo-list'

App::start = ->
  App.core   = new Backbone.Marionette.Application
  collection = new TodoList

  App.core.addRegions
    header: '#header'
    main:   '#main'
    footer: '#footer'

  App.core.addInitializer ->
    App.core.header.show new Header { collection }
    App.core.footer.show new Footer { collection }
    App.core.main.show new ListView { collection }
    collection.fetch()

  App.core.on 'start', ->
    controller = new Controller
    router     = new Router { controller }
    Backbone.history.start()

  App.core.start()
