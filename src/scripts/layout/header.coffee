module.exports = class Header extends Backbone.Marionette.LayoutView

  template: require '../template/header'

  ui:
    newTodo: '#new-todo'

  events:
    'keypress @ui.newTodo': 'onNewTodoKeypress'

  onNewTodoKeypress: (key) ->
    ENTER_KEY = 13
    todoText  = @.ui.newTodo.val().trim()

    if key.which is ENTER_KEY and todoText
      @collection.create { title: todoText }
      @.ui.newTodo.val ''
