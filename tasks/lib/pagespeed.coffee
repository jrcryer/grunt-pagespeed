#
# grunt-pagespeed
# http://www.jamescryer.com/grunt-pagespeed
#
# Copyright (c) 2013 James Cryer
# http://www.jamescryer.com
# Licensed under the MIT license.
#
'use strict';

googleapis = require('googleapis');

exports.init = (grunt) ->

  exports   = {}

  exports.run = (params, responseHandler) ->

    googleapis.discover("pagespeedonline", "v1").execute (err, client) ->
      grunt.fatal(err) if err
      grunt.verbose.writeln 'Pagespeed Insights: API Discovered'
      grunt.verbose.writeln 'Pagespeed Insights: Sending request'

      request = client.pagespeedonline.pagespeedapi.runpagespeed(params)

      request.execute (err, response) ->
        grunt.verbose.writeln 'Pagespeed Insights: Request completed'
        grunt.fatal(err) if err
        responseHandler(response)

  return exports
