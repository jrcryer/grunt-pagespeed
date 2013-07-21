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
      options:
        key: "API_KEY"
      prod:
        url: "https://developers.google.com/speed/docs/insights/v1/getting_started"
        locale: "en_GB"
        strategy: "desktop"
        threshold: 10

  grunt.loadTasks 'tasks'

  grunt.registerTask 'default', ['pagespeed']
