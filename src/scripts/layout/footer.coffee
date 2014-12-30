App = require '../app'

module.exports = class Footer extends Backbone.Marionette.LayoutView

  template: require '../template/footer'

  ui:
    filters:   '#filters a'
    completed: '.completed a'
    active:    '.active a'
    all:       '.all a'
    summary:   '#todo-count'
    clear:     '#clear-completed'

  events:
    'click @ui.clear': 'onClearClick'

  collectionEvents:
    'all': 'render'

  initialize: ->
    App.core.vent.on 'change:filter', (filter) => @updateFilterSelection filter

  serializeData: ->
    active = @collection.getActive().length
    total  = @collection.length
    data   = {
      activeCount:      active
      activeCountLabel: if active == 1 then 'item left' else 'items left'
      totalCount:       total
      completedCount:   total - active
    }

  onRender: ->
    @$el.parent().toggle @collection.length > 0
    @updateFilterSelection()

  updateFilterSelection: (filter) ->
    this.ui.filters.removeClass 'selected'
    this.ui[filter]?.addClass 'selected'

  onClearClick: ->
    App.core.vent.trigger 'clear:completed'
