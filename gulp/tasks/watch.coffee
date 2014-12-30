### Notes:
   - gulp/tasks/browserify.js handles js recompiling with watchify
   - gulp/tasks/browserSync.js watches and reloads compiled files
###

gulp   = require 'gulp'
config = require '../config'
css    = config.css.preprocessor

gulp.task 'watch', ['setWatch', 'browserSync'], ->
  gulp.watch config[css].src,   [css]
  gulp.watch config.images.src, ['images']
  gulp.watch config.markup.src, ['markup']
