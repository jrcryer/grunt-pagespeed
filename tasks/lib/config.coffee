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

  _         = grunt.util._
  exports   = {}
  config    = {}
  DEFAULT_THRESHOLD = 70

  key = ->
    grunt.fatal("API key is mandatory") unless config["key"]
    config["key"]

  url = ->
    config["url"] if config["url"]

  urls = ->
    return config["urls"] if config["urls"]
    [] unless config["urls"]

  paths = ->
    return config["paths"] if config["paths"]
    [''] unless config["paths"]

  locale = ->
    config["locale"] if config["locale"]

  strategy = ->
    config["strategy"] if config["strategy"]

  exports.params = (options) ->
    config = options

    params = for index, path of paths()
      param = {}
      param["key"] = key()
      param["url"] = url() + path
      param["locale"] = locale()
      param["strategy"] = strategy()
      param

    params

  exports.threshold = ->
    return DEFAULT_THRESHOLD unless config["threshold"]
    config["threshold"]

  return exports
