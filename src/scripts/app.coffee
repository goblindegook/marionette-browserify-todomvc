# Make the App class available right away:
module.exports = window.App = class App

Router     = require './router'
Controller = require './controller'
Header     = require './layout/header'
Footer     = require './layout/footer'
ListView   = require './view/list-view'
TodoList   = require './collection/todo-list'

App.prototype.start = ->
  App.core = new Backbone.Marionette.Application
  App.data = {}

  App.data.todoList = new TodoList

  App.core.addRegions
    header: '#header'
    main:   '#main'
    footer: '#footer'

  App.core.addInitializer ->
    App.core.header.show new Header { collection: App.data.todoList }
    App.core.footer.show new Footer { collection: App.data.todoList }
    App.core.main.show new ListView { collection: App.data.todoList }
    App.data.todoList.fetch()

  App.core.on 'start', ->
    App.controller = new Controller
    App.router     = new Router { controller: App.controller }
    Backbone.history.start()

  App.core.start()
