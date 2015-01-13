Header     = require './header'
Footer     = require './footer'
ListView   = require './list-view'

module.exports = class RootView extends Backbone.Marionette.LayoutView

  template: require '../template/root-view'

  regions:
    header: '#header'
    main:   '#main'
    footer: '#footer'

  initialize: (options) ->
    {@app, @collection} = options

  onRender: ->
    @header.show new Header { collection: @collection }
    @footer.show new Footer { app: @app, collection: @collection }
    @main.show new ListView { app: @app, collection: @collection }
