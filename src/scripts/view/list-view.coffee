App      = require '../app'
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

  initialize: ->
    App.core.vent.on 'change:filter', (filter) => @updateSelection filter

  addChild: (child) ->
    super if child.matchesFilter @filteredOn

  onRender: ->
    @update()

  updateSelection: (@filteredOn) ->
    @render()

  onToggleAllClick: (event) ->
    isChecked = event.currentTarget.checked
    @collection.forEach (todo) -> todo.save { 'completed': isChecked }

  update: ->
    # Update toggler state
    reduceCompleted = (left, right) -> left and right.get 'completed'
    allCompleted = @collection.reduce reduceCompleted, true
    this.ui.toggle.prop 'checked', allCompleted
    # View visibility
    @$el.parent().toggle @collection.length > 0
