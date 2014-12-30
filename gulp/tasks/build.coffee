gulp   = require 'gulp'
config = require '../config'
css    = config.css.preprocessor

gulp.task 'build', ['browserify', css, 'images', 'markup']
