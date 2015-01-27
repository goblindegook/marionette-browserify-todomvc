Backbone = require 'backbone'

module.exports = class Controller extends Backbone.Marionette.Controller

  filterTodo: (filter = 'all') ->
    Backbone.Radio.trigger 'global', 'change:filter', filter.trim()
