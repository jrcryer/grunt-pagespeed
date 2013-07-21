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

  score     = 0
  threshold = 70
  keyLength = 30
  exports   = {}

  generateScore = (response) ->
    div     = Array(keyLength * 2).join "-"
    output  = "#{div}\nURL:   #{response.id} \nScore: #{score}\n#{div}"
    print output

  generateRuleSetResults = (rulesets) ->
    ""

  generateStatistics = (statistics) ->

    for title, result of statistics
       title  = title.charAt(0).toUpperCase() + (title.replace(/([A-Z]+)/g, " $1").replace(/([A-Z][a-z])/g, " $1")).slice(1)
       title += bufferSpace(title)

       print "#{title}: #{result}"

  print = (msg) ->
    grunt.log.ok(msg) if score >= threshold
    grunt.log.error(msg) if score < threshold

  bufferSpace = (msg) ->
    buffer = ""
    buffer = Array(keyLength - msg.length).join(" ") if keyLength - msg.length  > 0
    buffer

  exports.threshold = (limit) ->
    threshold = limit

  exports.process = (response) ->
    grunt.verbose.writeln 'Pagespeed Insights: Processing results'

    score = response.score
    generateScore(response)
    generateStatistics(response.pageStats)
    generateRuleSetResults(response.formattedResults.ruleResults)

    grunt.fatal "Threshold of #{threshold} not met with score of #{response.score}" if response.score < threshold

  return exports
