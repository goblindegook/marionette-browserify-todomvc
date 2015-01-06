###
browserify task
---------------
Bundle javascripty things with browserify!

This task is set up to generate multiple separate bundles, from
different sources, and to use Watchify when run from the default task.

See browserify.bundleConfigs in gulp/config.js
###

gulp            = require 'gulp'
browserify      = require 'browserify'
source          = require 'vinyl-source-stream'
watchify        = require 'watchify'
resolve         = require 'resolve'
config          = require '../config'
bundleLogger    = require '../util/bundleLogger'
handleErrors    = require '../util/handleErrors'
packageManifest = require '../../package.json'

gulp.task 'browserify', (callback) ->

  bundleQueue = config.browserify.bundleConfigs.length

  browserifyThis = (bundleConfig) ->
    bundler = browserify
      cache: {}
      packageCache: {}
      fullPaths: false
      entries: bundleConfig.entries
      extensions: config.browserify.extensions
      debug: config.browserify.debug

    # include vendor packages
    if bundleConfig.vendor is true
      for dep, version of packageManifest.dependencies
        bundler.require resolve.sync(dep), { expose: dep }

    # expose vendor packages without including them
    if bundleConfig.vendor is false
      for dep, version of packageManifest.dependencies
        bundler.external dep

    bundle = ->
      bundleLogger.start bundleConfig.outputName

      # uglify code
      unless config.browserify.debug
        bundler.transform { global: true }, 'uglifyify'

      bundler.bundle()
        .on 'error', handleErrors
        .pipe source bundleConfig.outputName
        .pipe gulp.dest bundleConfig.dest
        .on 'end', reportFinished

    if global.isWatching
      bundler = watchify bundler
      bundler.on 'update', bundle

    reportFinished = ->
      bundleLogger.end bundleConfig.outputName

      if bundleQueue > 0
        bundleQueue--
        # If queue is empty, tell gulp the task is complete.
        # https://github.com/gulpjs/gulp/blob/master/docs/API.md#accept-a-callback
        callback() if bundleQueue is 0

    bundle()

  # Start bundling with Browserify for each bundleConfig specified
  config.browserify.bundleConfigs.forEach browserifyThis
