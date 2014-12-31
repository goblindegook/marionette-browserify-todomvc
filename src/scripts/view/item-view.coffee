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
    'dblclick @ui.label': 'onEditTodoStart'
    'keydown @ui.edit':   'onEditTodoKeydown'
    'blur @ui.edit':      'onEditTodoStop'

  modelEvents:
    'change': 'render'

  onRender: ->
    @$el.removeClass 'active completed'
    @$el.addClass if @model.get 'completed' then 'completed' else 'active'

  onDeleteTodo: ->
    @model.destroy()

  onToggleTodo: ->
    @model.toggle().save()

  toggleEditingMode: ->
    @$el.toggleClass 'editing'

  onEditTodoStart: ->
    @toggleEditingMode()
    @.ui.edit.focus().val @.ui.label.text()

  onEditTodoKeydown: (key) ->
    ENTER_KEY  = 13
    ESCAPE_KEY = 27

    if key.which is ENTER_KEY
      @.ui.edit.trigger 'blur'

    if key.which is ESCAPE_KEY
      @.ui.edit.val @model.get 'title'
      @.ui.edit.trigger 'blur'

  onEditTodoStop: ->
    @toggleEditingMode()
    todoText = @.ui.edit.val().trim()

    if todoText
      @model.set('title', todoText).save()
    else
      @model.destroy()
