# Backbone.Marionette and Browserify TodoMVC Example

This implementation of the TodoMVC application uses [Backbone.Marionette](http://marionettejs.com/) --- an application library for Backbone.js --- and [Browserify](http://browserify.org/) module bundling.

It is written in [CoffeeScript](http://coffeescript.org/) and uses [Gulp](http://gulpjs.com/) as a build system.

It was created to assess how well these technologies work together (especially Browserify), and any improvement tips are welcomed.

Because I'm mostly interested in Browserify at the moment, I am concentrating my attention on getting the most out of Browserify transforms such as `browserify-shim`, `aliasify` and `remapify`, as well as finding the best way to create separate bundles for application code and infrastructure (Backbone, Marionette, etc.)
