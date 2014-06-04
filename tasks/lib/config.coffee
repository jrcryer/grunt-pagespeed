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
  DEFAULT_THRESHOLD = 70

  key = ->
    config["key"] if config["key"]

  nokey = ->
    config["nokey"] if config["nokey"]

  url = ->
    config["url"] if config["url"]

  urls = ->
    return config["urls"] if config["urls"]
    [] unless config["urls"]

  paths = ->
    return config["paths"] if config["paths"]
    [''] unless config["paths"]

  locale = ->
    grunt.fatal("Locale key is mandatory") unless config["locale"]
    config["locale"] if config["locale"]

  strategy = ->
    config["strategy"] if config["strategy"]

  threshold = ->
    return DEFAULT_THRESHOLD unless config["threshold"]
    config["threshold"]

  exports.params = (options) ->
    config = options

    unless key() or nokey()
      grunt.fatal("Please supply a key or use the nokey option")

    params = for index, path of paths()
      param = {}
      param["key"] = key() if config["key"]
      param["nokey"] = nokey() if config["nokey"]
      param["url"] = url() + path
      param["locale"] = locale()
      param["strategy"] = strategy()
      param["threshold"] = threshold()
      param

    params

  exports.threshold = threshold


  return exports
