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
    'all': 'updateToggleAllState'

  filteredOn: 'all'

  initialize: ->
    App.core.vent.on 'change:filter', (filter) =>
      @filteredOn = filter
      @render()

  addChild: (child) ->
    if child.matchesFilter @filteredOn
      Backbone.Marionette.CompositeView.prototype.addChild.apply @, arguments

  onRender: ->
    @updateToggleAllState()

  onToggleAllClick: (event) ->
    isChecked = event.currentTarget.checked
    @collection.forEach (todo) -> todo.save { 'completed': isChecked }

  updateToggleAllState: ->
    reduceCompleted = (left, right) -> left and right.get 'completed'
    allCompleted = @collection.reduce reduceCompleted, true
    this.ui.toggle.prop 'checked', allCompleted
    @$el.parent().toggle @collection.length > 0
