Todo = require '../model/todo'

module.exports = class TodoList extends Backbone.Collection

  model: Todo

  localStorage: new Backbone.LocalStorage 'marionette-todomvc'

  comparator: 'created'

  getCompleted: ->
    @where { completed: true }

  getActive: ->
    @where { completed: false }

  clearCompleted: ->
    todo.destroy() for todo in @getCompleted()

  isCompleted: ->
    reduceCompleted = (completed, model) -> completed and model.get 'completed'
    @reduce reduceCompleted, true
