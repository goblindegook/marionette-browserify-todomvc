gulp         = require 'gulp'
browserSync  = require 'browser-sync'
less         = require 'gulp-less'
sourcemaps   = require 'gulp-sourcemaps'
autoprefixer = require 'gulp-autoprefixer'
handleErrors = require '../util/handleErrors'
config       = require '../config'

gulp.task 'less', ['images'], ->
  gulp.src config.less.src
    .pipe sourcemaps.init()
    .pipe less config.less.settings
    .on 'error', handleErrors
    .pipe sourcemaps.write()
    .pipe autoprefixer { browsers: ['last 2 version'] }
    .pipe gulp.dest config.less.dest
    .pipe browserSync.reload { stream: true }
