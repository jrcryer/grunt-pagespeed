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

  exports.run = (runs, responseHandler, done) ->
    numOfRuns = runs.length
    index     = 0
    for current, run of runs
      googleapis.discover("pagespeedonline", "v1").execute (err, client) ->
        grunt.fatal(err) if err
        grunt.verbose.writeln 'Pagespeed Insights: API Discovered'
        grunt.verbose.writeln 'Pagespeed Insights: Sending request'
        grunt.verbose.writeflags(run, "Params:")

        request = client.pagespeedonline.pagespeedapi.runpagespeed(run)
        request.execute (err, response) ->
          index++
          grunt.verbose.writeln 'Pagespeed Insights: Request completed'
          grunt.fatal(err) if err
          return responseHandler(response, done) if index == numOfRuns
          responseHandler(response)

  return exports
