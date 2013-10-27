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
        url: "http://developers.google.com"
      single:
        options:
          url: "https://developers.google.com/speed/docs/insights/v1/getting_started"
          locale: "en_GB"
          strategy: "desktop"
          threshold: 80
      paths:
        options:
          paths: ["/speed/docs/insights/about", "/speed/docs/insights/v1/getting_started"]
          locale: "en_GB"
          strategy: "desktop"
          threshold: 80

  grunt.loadTasks 'tasks'

  grunt.registerTask 'default', ['pagespeed']
