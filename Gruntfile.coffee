module.exports = (grunt) ->
  # look in `grunt/` for task configurations
  grunt.loadTasks 'grunt'

  grunt.registerTask 'default', ['coffeelint', 'coffee', 'uglify']
