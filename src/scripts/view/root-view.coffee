Backbone = require 'backbone'
Header   = require './header'
Footer   = require './footer'
ListView = require './list-view'

module.exports = class RootView extends Backbone.Marionette.LayoutView

  template: require '../template/root-view'

  regions:
    header: '#header'
    main:   '#main'
    footer: '#footer'

  initialize: (options) ->
    {@collection} = options

  onRender: ->
    @header.show new Header { collection: @collection }
    @footer.show new Footer { collection: @collection }
    @main.show new ListView { collection: @collection }
