#
# grunt-pagespeed
# http://www.jamescryer.com/grunt-pagespeed
#
# Copyright (c) 2013 James Cryer
# http://www.jamescryer.com
# Licensed under the MIT license.
#
'use strict'

module.exports = (grunt) ->
  grunt.initConfig
    pagespeed:

  grunt.loadTasks 'tasks'

  grunt.registerTask 'default', ['pagespeed']
