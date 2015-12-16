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

    for index, options of params
      current++
      psi.output(options.url, options).then (response) ->
        done() if numOfTests == current
      .catch (err) ->
        done(err) if numOfTests == current
