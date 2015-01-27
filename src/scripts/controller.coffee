Backbone = require 'backbone'
Radio    = require './radio'

module.exports = class Controller extends Backbone.Marionette.Controller

  filterTodo: (filter = 'all') ->
    Radio.trigger 'change:filter', filter.trim()
