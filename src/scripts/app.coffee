Router     = require './router'
Controller = require './controller'
RootView   = require './view/root-view'
TodoList   = require './collection/todo-list'

module.exports = class TodoMVC extends Backbone.Marionette.Application

  onStart: ->
    app        = @
    controller = new Controller { app }
    router     = new Router { controller }
    collection = new TodoList
    rootView   = new RootView { el: '#todoapp', app, collection }

    collection.fetch()
    rootView.render()
    Backbone.history.start()
