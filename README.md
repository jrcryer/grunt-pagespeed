# grunt-pagespeed [![Build Status](https://travis-ci.org/jrcryer/grunt-pagespeed.svg?branch=master)](https://travis-ci.org/jrcryer/grunt-pagespeed) [![devDependency Status](https://david-dm.org/jrcryer/grunt-pagespeed/dev-status.svg)](https://david-dm.org/jrcryer/grunt-pagespeed#info=devDependencies)  [![Dependency Status](https://david-dm.org/jrcryer/grunt-pagespeed.svg)](https://david-dm.org/jrcryer/grunt-pagespeed)

> Grunt plugin for running [Google PageSpeed Insights](https://developers.google.com/speed/docs/insights/)

Run mobile and desktop performance tests for your deployed site using Google PageSpeed Insights, uses [psi](https://github.com/addyosmani/psi/)  and [gpagespeed](https://github.com/zrrrzzt/gpagespeed/).

_This plugin is developed for Grunt `0.4.1` and is not tested for backward compatibility with Grunt `0.3.x`._

## Install

Install this grunt plugin with the following command:


    npm install grunt-pagespeed --save-dev


## Loading the plugin

Add this to your project's `Gruntfile.js` gruntfile:


    grunt.loadNpmTasks('grunt-pagespeed');


Or, add this to your project's `Gruntfile.coffee` gruntfile:


    grunt.loadNpmTasks 'grunt-pagespeed'


Alternatively use [load-grunt-tasks](https://github.com/sindresorhus/load-grunt-tasks) to load your plugins.


    require('load-grunt-tasks')(grunt);


## Google API Key

By default we recommend using the nokey option to test-drive PageSpeed Insights. This doesn't require any extra work on your part nor an API key.

For a production-level build process, registering for an API key is recommended from the [Google Developer Console](https://developers.google.com/speed/docs/insights/v1/getting_started#auth) in order to use this module.

## Pagespeed task

_Run this task with the `grunt pagespeed` command._

_This task is a [multi task][] so any targets, files and options should be specified according to the [multi task][] documentation._

[multi task]: https://github.com/gruntjs/grunt/wiki/Configuring-tasks


###Usage Example


    pagespeed: {
      options: {
        nokey: true,
        url: "https://developers.google.com"
      },
      prod: {
        options: {
          url: "https://developers.google.com/speed/docs/insights/v1/getting_started",
          locale: "en_GB",
          strategy: "desktop",
          threshold: 80
        }
      },
      paths: {
        options: {
          paths: ["/speed/docs/insights/v1/getting_started", "/speed/docs/about"],
          locale: "en_GB",
          strategy: "desktop",
          threshold: 80
        }
      }
    }

### Options

#### nokey
Type: `Boolean`

Use the nokey option to test-drive PageSpeed Insights before acquiring a key for production builds.

#### key
Type: `String`

[Google API Key](https://code.google.com/apis/console/)

#### url
Type: `String`

The URL of the page for which the PageSpeed Insights API should generate results.

### Target Properties

#### url
Type: `String`

The URL of the page for which the PageSpeed Insights API should generate results.

#### locale
Type: `String`

The locale that results should be generated in.  **This is mandatory.**

#### strategy
Type: `String`

The strategy to use when analyzing the page. Valid values are desktop and mobile.

#### threshold
Type: `Number`

Threshold score that is needed to pass the pagespeed test

#### paths
Type: `Array`

An array of URL paths that are appended to the URL

### Sample output

The grunt task outputs the results as follows if everything passes:

![Passing task](http://www.jamescryer.com/img/pass.png)

If the task fails to pass the threshold, then it ouputs something similar to the image below:

![Failing task](http://www.jamescryer.com/img/fail.png)

## License

[MIT](http://opensource.org/licenses/MIT) © [James Cryer](http://www.jamescryer.com)
