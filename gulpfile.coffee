gulp = require('gulp')
browser = require('browser-sync') # Live Reload, Browser Syncing
coffee  = require('gulp-coffee')  # Compile CoffeeScript files
plumber = require('gulp-plumber') # Prevent pipe breaking caused by errors

## Requires
#
# + type `npm install` to install all required packages

## Commands
#
# + `gulp`
#    starts server to sync code and browser, and watch the coffee files.
#    If you touch coffee files, gulp will compile coffee files,
#    and auto reload browser.
#

gulp.task 'default', ['server'], ->
  file_coffee = 'coffee/**/*.coffee'
  console.log "watching #{file_coffee}"
  gulp.watch(file_coffee, ['coffee'])

gulp.task 'coffee', ->
  gulp.src('coffee/**/*.coffee')
    .pipe(plumber())
    .pipe(coffee().on('error', console.log))
    .pipe(gulp.dest('js/'))
    .pipe(browser.reload(stream: true))

gulp.task 'server', ->
  browser(
    server:
      baseDir: './'
  )
