#
# grunt-pagespeed
# http://www.jamescryer.com/grunt-pagespeed
#
# Copyright (c) 2013 James Cryer
# http://www.jamescryer.com
# Licensed under the MIT license.
#
'use strict';

exports.init = (grunt) ->

  exports   = {}

  generateScore = (response) ->
    ""

  generateRuleSetResults = (rulesets) ->
    ""

  generateStatistics = (statistics) ->
    ""

  exports.process = (response) ->
    grunt.verbose.writeln 'Pagespeed Insights: Processing results'

    grunt.log.writeln generateScore(response)
    + generateStatistics(response.pageStats)
    + generateRuleSetResults(response.formattedResults.ruleResults)

  return exports
