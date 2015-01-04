Router     = require './router'
Controller = require './controller'
Header     = require './view/header'
Footer     = require './view/footer'
ListView   = require './view/list-view'
TodoList   = require './collection/todo-list'

# Make the App class available right away:
module.exports = class TodoMVC extends Backbone.Marionette.Application

  regions:
    header: '#header'
    main:   '#main'
    footer: '#footer'

  onStart: ->
    controller = new Controller { app: @ }
    router     = new Router { controller }
    collection = new TodoList

    @header.show new Header { collection }
    @footer.show new Footer { app: @, collection }
    @main.show new ListView { app: @, collection }

    collection.fetch()
    Backbone.history.start()
