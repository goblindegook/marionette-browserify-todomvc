Backbone = require 'backbone'
Radio    = require '../radio'

module.exports = class Footer extends Backbone.Marionette.ItemView

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
    Radio.on 'change:filter', (filter) => @updateFilterSelection filter

  serializeData: ->
    active = @collection.getActive().length
    total  = @collection.length
    data   = {
      activeCount:      active
      activeCountLabel: if active is 1 then 'item left' else 'items left'
      totalCount:       total
      completedCount:   total - active
    }

  onRender: ->
    @$el.parent().toggle @collection.length > 0
    @updateFilterSelection()

  updateFilterSelection: (filter) ->
    @.ui.filters.removeClass 'selected'
    @.ui[filter]?.addClass 'selected'

  onClearClick: ->
    @collection.clearCompleted()
