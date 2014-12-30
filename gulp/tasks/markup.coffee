gulp   = require 'gulp'
config = require '../config'

gulp.task 'markup', ->
  gulp.src config.markup.src
    .pipe gulp.dest config.markup.dest
