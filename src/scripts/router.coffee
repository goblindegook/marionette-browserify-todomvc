module.exports = class Router extends Backbone.Marionette.AppRouter

  appRoutes:
    '*filter': 'filterTodo'
