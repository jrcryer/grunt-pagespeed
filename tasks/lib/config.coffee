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
  DEFAULT_FORMAT = 'cli'

  key = ->
    config["key"] if config["key"]

  format = ->
    return config["format"] if config["format"]
    return DEFAULT_FORMAT unless config["format"]

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

  timeout = ->
    config["timeout"] if config["timeout"]

  file = ->
    config["file"] + ".json" if config["file"]

  filepath = ->
    config["filepath"] if config["filepath"]

  format = ->
    return "json" if config["file"]
    return config["format"] if config["format"] && config['format'].match(/json|cli|tap/)
    'cli' unless config["format"] && config['format'].match(/json|cli|tap/)

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
      param["filepath"] = filepath()
      param["file"] = file()
      param["format"] = format() if config["format"]
      param

    params

  exports.threshold = threshold


  return exports
