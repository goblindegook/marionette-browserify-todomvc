App  = require './app'

module.exports = class Controller extends Backbone.Marionette.Controller

  filterTodo: (filter = 'all') ->
    App.core.vent.trigger 'change:filter', filter.trim()
