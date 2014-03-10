module.exports = (grunt) ->

  grunt.config 'coffeelint',
    lib:
      options:
        'max_line_length':
          level: 'ignore'
      files:
        src: [ 'src/**/*.litcoffee', 'src/**/*.coffee' ]

  grunt.loadNpmTasks 'grunt-coffeelint'
