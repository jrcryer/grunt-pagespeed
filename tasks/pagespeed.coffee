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

  config = require('./lib/config').init grunt
  psi    = require('psi')

  grunt.registerMultiTask 'pagespeed', 'Run Pagespeed Insights', ->
    done       = this.async()
    params     = config.params this.options(this.data)
    numOfTests = params.length
    current    = 0

    output = []

    for index, options of params
      # safe output to file
      if options.file
        psi(options.url, options).then (data) ->
          current++
          grunt.log.write 'url:' + data.id + ' '
          grunt.log.ok 'score:' + data.ruleGroups.SPEED.score
          # full output
          # output.push {data}
          output.push {'url': data.id, 'score': data.ruleGroups.SPEED.score, 'pageStats': data.pageStats }
          if numOfTests == current
            grunt.file.write options.filepath + options.file, JSON.stringify(output, false, 4)
            grunt.log.writeln(' ')
            grunt.log.ok 'Wrote output to ' + options.filepath + options.file
            done()
        .catch (err) ->
          current++
          done(err) if numOfTests == current
      # print output to cli
      else
        psi.output(options.url, options).then (response) ->
          current++
          done() if numOfTests == current
        .catch (err) ->
          current++
          done(err) if numOfTests == current
