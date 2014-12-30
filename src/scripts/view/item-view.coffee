App = require '../app'

module.exports = class ItemView extends Backbone.Marionette.ItemView

  tagName: 'li'

  template: require '../template/todo-item-view'

  ui:
    toggle:  '.toggle'
    label:   'label'
    edit:    '.edit'
    destroy: '.destroy'

  events:
    'click @ui.toggle':   'onToggleTodo'
    'click @ui.destroy':  'onDeleteTodo'
    'dblclick @ui.label': 'onEditStart'
    'keydown @ui.edit':   'onEditKeypress'
    'blur @ui.edit':      'onEditStop'

  modelEvents:
    'change': 'render'

  todoText: ''

  initialize: ->
    @todoText = @model.get 'title'

  onRender: ->
    @$el.removeClass 'active completed'
    @$el.addClass if @model.get 'completed' then 'completed' else 'active'

  onDeleteTodo: ->
    @model.destroy()

  onToggleTodo: ->
    @model.toggle().save()

  toggleEditingMode: ->
    @$el.toggleClass 'editing'

  onEditStart: ->
    @toggleEditingMode()
    this.ui.edit.focus().val @todoText

  onEditKeypress: (event) ->
    ENTER_KEY  = 13
    ESCAPE_KEY = 27

    if event.which == ENTER_KEY
      this.ui.edit.trigger 'blur'

    if event.which == ESCAPE_KEY
      this.ui.edit.val @model.get 'title'
      this.ui.edit.trigger 'blur'

  onEditStop: (event) ->
    @toggleEditingMode()
    @todoText = event.target.value.trim()

    if @todoText
      @model.set('title', @todoText).save()
    else
      @model.destroy()
