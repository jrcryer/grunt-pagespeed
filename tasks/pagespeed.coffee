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
        psi(options.url, options, (err, data) ->
          current++
          unless err
            grunt.log.write '.'
            output.push {'url': options.url, 'score': data.score, 'pageStats': data.pageStats }
          if numOfTests == current
            #console.log filepath + filename
            grunt.file.write options.filepath + options.file, JSON.stringify(output, false, 4)
            grunt.log.writeln(' ')
            grunt.log.ok 'Wrote output to ' + options.filepath + options.file
            done(err)
        )
      # print output to cli
      else
        psi.output(options.url, options, (err, response) ->
          current++
          done(err) if numOfTests == current
        )
