module.exports = (grunt) ->

  grunt.config 'uglify',
    lib:
      src: [ 'lib/dropdown.js' ]
      dest: 'lib/dropdown.min.js'

  grunt.loadNpmTasks 'grunt-contrib-uglify'
