module.exports = (grunt) ->

  # Project configuration
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'js/nas.js'
        dest: 'js/nas.min.js'
      }
    }
    coffee: {
      compile: {
        files: {
          'js/nas.js': 'src/nas.coffe',
          'spec/NasSpec.js': 'spec/NasSpec.coffee'
        }
      }
    },
    jasmine: {
      src: ['js/nas.js', 'lib/vendor/*.js'],
      options: {
        specs: 'spec/**/*.js'
      }
    },
    less: {
      development: {
        files: {
          'css/nas.css': 'less/nas.less'
        }
      },
      production: {
        options: {
          cleancss: true
        },
        files: {
          'css/nas.css': 'less/nas.less'
        }
      },
    },
    watch: {
      coffee: {
        files: 'src/nas.coffee',
        tasks: ['coffee']
      }
      less: {
        files: 'less/nas.less',
        tasks: ['less']
      }
      test: {
        files: 'spec/NasSpec.coffee',
        tasks: ['coffee']
      }
    }
  })

  # Load the plugin that provides the "uglify" task
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-jasmine')
  grunt.loadNpmTasks('grunt-contrib-watch')
  
  # Default tasks
  grunt.registerTask('default', ['uglify'])
