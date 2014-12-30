module.exports = class Header extends Backbone.Marionette.LayoutView

  template: require '../template/header'

  ui:
    input: '#new-todo'

  events:
    'keypress @ui.input': 'onInputKeypress'

  onInputKeypress: (event) ->
    ENTER_KEY = 13
    todoText  = this.ui.input.val().trim()

    if event.which == ENTER_KEY && todoText
      @collection.create { title: todoText }
      this.ui.input.val ''
