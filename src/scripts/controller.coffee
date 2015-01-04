module.exports = class Controller extends Backbone.Marionette.Controller

  initialize: (options) ->
    @app = options.app

  filterTodo: (filter = 'all') ->
    @app.vent.trigger 'change:filter', filter.trim()
