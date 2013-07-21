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
  config    = {}

  key = ->
    grunt.fatal("API key is mandatory") unless config["key"]
    config["key"]

  url = ->
    config["url"] if config["url"]

  locale = ->
    config["locale"] if config["locale"]

  strategy = ->
    config["strategy"] if config["strategy"]

  exports.params = (options) ->
    config = options

    params = {}
    params["key"] = key() if key()
    params["url"] = url() if url()
    params["locale"] = locale() if locale()
    params["strategy"] = strategy() if strategy()
    params

  return exports
