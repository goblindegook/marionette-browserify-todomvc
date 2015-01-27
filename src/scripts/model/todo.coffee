Backbone = require 'backbone'

module.exports = class Todo extends Backbone.Model

  defaults:
    title:     ''
    completed: false
    created:   0

  initialize: ->
    if @isNew() then @set 'created', Date.now()

  toggle: ->
    @set 'completed', not @isCompleted()

  isCompleted: ->
    @get 'completed'

  matchesFilter: (filter) ->
    return @isCompleted()     if filter is 'completed'
    return not @isCompleted() if filter is 'active'
    true
