ItemView = require './item-view'

module.exports = class ListView extends Backbone.Marionette.CompositeView

  template: require '../template/todo-list-composite-view'

  childView: ItemView

  childViewContainer: '#todo-list'

  ui:
    toggle: '#toggle-all'

  events:
    'click @ui.toggle': 'onToggleAllClick'

  collectionEvents:
    'all': 'update'

  filteredOn: 'all'

  initialize: (options) ->
    @app = options.app
    @app.vent.on 'change:filter', (filter) => @updateSelection filter

  addChild: (child) ->
    super if child.matchesFilter @filteredOn

  onRender: ->
    @update()

  updateSelection: (@filteredOn) ->
    @render()

  onToggleAllClick: (click) ->
    completed = click.currentTarget.checked
    @collection.forEach (todo) -> todo.save { completed }

  update: ->
    @.ui.toggle.prop 'checked', @collection.isCompleted()
    @$el.parent().toggle @collection.length > 0
