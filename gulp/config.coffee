src   = './src'
dest  = './build'
debug = true

module.exports =

  src: src

  dest: dest

  environment:
    debug: debug

  css:
    preprocessor: 'sass'

  sass:
    src: src + '/sass/*.{sass,scss}'
    dest: dest
    settings:
      sourceComments: 'map'
      imagePath: '/images'

  less:
    src: src + '/less/app.less'
    dest: dest
    settings:
      compress: true

  images:
    src: src + '/images/**'
    dest: dest + '/images'

  markup:
    src: src + '/htdocs/**'
    dest: dest

  browserSync:
    server:
      baseDir: [dest, src]
    files: [
      dest + '/**'
      '!' + dest + '/**.map' # Exclude sourcemaps
    ]

  browserify:
    debug: debug,
    # Additional file extentions to make optional
    extensions: ['.coffee', '.cson', '.yaml', '.json', '.hbs', '.dust']
    # A separate bundle will be generated for each
    # bundle config in the list below
    bundleConfigs: [
      entries: src + '/scripts/main.coffee'
      dest: dest
      outputName: 'main.js'
    ,
      entries: src + '/scripts/infrastructure.coffee'
      dest: dest
      outputName: 'infrastructure.js'
    ]
