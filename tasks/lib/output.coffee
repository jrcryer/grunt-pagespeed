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

  threshold = 70
  exports   = {}

  generateScore = (response) ->
    score  = response.score
    output = "URL:   #{response.id} \nScore: #{score}"
    grunt.log.ok(output) if score >= threshold
    grunt.log.error(output) if score < threshold

  generateRuleSetResults = (rulesets) ->
    ""

  generateStatistics = (statistics) ->
    ""

  exports.threshold = (limit) ->
    threshold = limit

  exports.process = (response) ->
    grunt.verbose.writeln 'Pagespeed Insights: Processing results'

    generateScore(response)
    generateStatistics(response.pageStats)
    generateRuleSetResults(response.formattedResults.ruleResults)


    grunt.fatal "Threshold of #{threshold} not met with score of #{response.score}" if response.score < threshold

  return exports
