module.exports = (grunt) ->

  grunt.config 'coffee',
    lib:
      files:
        'lib/dropdown.js' : [ 'src/**/*.litcoffee', 'src/**/*.coffee' ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
