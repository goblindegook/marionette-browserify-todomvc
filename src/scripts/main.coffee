global._              = require 'lodash', exposes: 'underscore'
global.Backbone       = require 'backbone'
Backbone.$            = require 'jquery'
Backbone.LocalStorage = require 'backbone.localstorage'
Backbone.Marionette   = require 'backbone.marionette.dust'

TodoMVC               = require './app'

(new TodoMVC).start()
