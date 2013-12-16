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
          'js/nas.js': 'src/nas.coffe'
        }
      }
    },
    jasmine: {
      src: ['js/nas.js', 'lib/vendor/*.js'],
      options: {
        specs: 'spec/**/*.js'
      }
    }
  })

  # Load the plugin that provides the "uglify" task
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-jasmine')
  
  # Default tasks
  grunt.registerTask('default', ['uglify'])
