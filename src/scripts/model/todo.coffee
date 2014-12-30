module.exports = class Todo extends Backbone.Model

  defaults:
    title:     ''
    completed: false
    created:   0

  localStorage: new Backbone.LocalStorage 'marionette-todomvc'

  initialize: ->
    if @isNew() then @set 'created', Date.now()

  toggle: ->
    @set 'completed', not @isCompleted()

  isCompleted: ->
    @get 'completed'

  matchesFilter: (filter) ->
    return true if filter == 'all'
    if filter == 'active' then not @isCompleted() else @isCompleted()
