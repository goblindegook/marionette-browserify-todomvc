Backbone   = require 'backbone'
Router     = require './router'
Controller = require './controller'
RootView   = require './view/root-view'
TodoList   = require './collection/todo-list'

class TodoMVC extends Backbone.Marionette.Application

  onStart: ->
    controller = new Controller
    router     = new Router { controller }
    collection = new TodoList
    rootView   = new RootView { el: '#todoapp', collection }

    collection.fetch()
    rootView.render()
    Backbone.history.start()

module.exports = new TodoMVC
