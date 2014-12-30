gulp         = require 'gulp'
browserSync  = require 'browser-sync'
sass         = require 'gulp-sass'
sourcemaps   = require 'gulp-sourcemaps'
autoprefixer = require 'gulp-autoprefixer'
handleErrors = require '../util/handleErrors'
config       = require '../config'

gulp.task 'sass', ['images'], ->
  gulp.src config.sass.src
    .pipe sourcemaps.init()
    .pipe sass config.sass.settings
    .on 'error', handleErrors
    .pipe sourcemaps.write()
    .pipe autoprefixer { browsers: ['last 2 version'] }
    .pipe gulp.dest config.sass.dest
    .pipe browserSync.reload { stream: true }

