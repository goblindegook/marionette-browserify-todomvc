Todo = require '../model/todo'

module.exports = class TodoList extends Backbone.Collection
  
  model: Todo

  localStorage: new Backbone.LocalStorage 'marionette-todomvc'

  comparator: 'created'

  initialize: ->
    App.core.vent.on 'clear:completed', => @clearCompleted()

  getCompleted: ->
    @where { completed: true }

  getActive: ->
    @where { completed: false }

  clearCompleted: ->
    @getCompleted().each (todo) -> todo.destroy()
