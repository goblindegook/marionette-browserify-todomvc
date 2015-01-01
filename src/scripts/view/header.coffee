module.exports = class Header extends Backbone.Marionette.ItemView

  template: require '../template/header'

  ui:
    newTodo: '#new-todo'

  events:
    'keydown @ui.newTodo': 'onNewTodoKeypress'

  onNewTodoKeypress: (key) ->
    ENTER_KEY = 13
    title     = @.ui.newTodo.val().trim()

    if key.which is ENTER_KEY and title
      @collection.create { title }
      @.ui.newTodo.val ''
