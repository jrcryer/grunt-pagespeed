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
  exports   = {}

  #
  # Generate score output
  #
  generateScore = (response) ->
    output  = "URL:   #{response.id} \nScore: #{score}"
    print output

  #
  # Generate ruleset output
  #
  generateRuleSetResults = (rulesets) ->

    for title, result of rulesets
      title  = firstToUpperCaseAndAddSpace(title)
      title += bufferSpace(title)
      ruleImpact  = Math.ceil(result.ruleImpact * 100)/100;
      print "#{title}| #{ruleImpact}"

  #
  # Generate statistics output
  #
  generateStatistics = (statistics) ->

    for title, result of statistics
       title  = firstToUpperCaseAndAddSpace(title)
       title += bufferSpace(title)
       print "#{title}| #{result}"

  #
  # Prints result based on whether the current score
  # has passed the threshold
  #
  print = (msg) ->
    grunt.log.ok(msg) if score >= threshold
    grunt.log.error(msg) if score < threshold

  #
  # Adds buffer space to string
  #
  bufferSpace = (msg, length = 50) ->
    buffer = ""
    buffer = Array(length - msg.length).join(" ") if length - msg.length  > 0
    buffer

  #
  # Adds spaces to camel case and uppercases first word
  #
  firstToUpperCaseAndAddSpace = (msg) ->
    msg.charAt(0).toUpperCase() + addSpacesToWords(msg.slice(1))

  #
  # Adds spaces to words
  #
  addSpacesToWords = (msg) ->
    (msg.replace(/([A-Z]+)/g, " $1").replace(/([A-Z][a-z])/g, " $1"))

  #
  # Prints a divider
  #
  divder = (length = 65)->
    print ""
    print(Array(length).join "-")
    print ""

  #
  # Setter for threshold
  #
  exports.threshold = (limit) ->
    threshold = limit

  #
  # Processes and outputs results
  #
  exports.process = (response, done = (->)) ->
    grunt.verbose.writeln 'Pagespeed Insights: Processing results'

    score = response.score
    divder()
    generateScore(response)
    divder()
    generateStatistics(response.pageStats)
    divder()
    generateRuleSetResults(response.formattedResults.ruleResults)
    divder()

    grunt.fatal "Threshold of #{threshold} not met with score of #{response.score}" if response.score < threshold
    done()
  return exports
