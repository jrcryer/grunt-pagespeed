# grunt-pagespeed

> Grunt plugin for running [Google PageSpeed Insights](https://developers.google.com/speed/docs/insights/)


_This plugin is developed for Grunt `0.4.1` and is not tested for backward compatibility with Grunt `0.3.x`._

##Getting Started
1. Install this grunt plugin with the following command:

    ```shell
    npm install grunt-pagespeed --save-dev
    ```

2. Add this to your project's `Gruntfile.js` gruntfile:

    ```js
    grunt.loadNpmTasks('grunt-pagespeed');
    ```


##Pagespeed task
_Run this task with the `grunt pagespeed` command._

_This task is a [multi task][] so any targets, files and options should be specified according to the [multi task][] documentation._

[multi task]: https://github.com/gruntjs/grunt/wiki/Configuring-tasks

###Usage Example

```js
pagespeed: {
    prod: {
        url: "https://developers.google.com/speed/docs/insights/v1/getting_started"
        locale: "en_GB"
        strategy: "desktop"
        threshold: 80
    },
    options: {
        key: "API_KEY"
    }
}
```

###Target Properties
####url
Type: `String`

The URL of the page for which the PageSpeed Insights API should generate results.

###Options
####locale
Type: `String`

The locale that results should be generated in.

####strategy
Type: `String`

The strategy to use when analyzing the page. Valid values are desktop and mobile.

####threshold
Type: `String`

Threshold score that is needed to pass the pagespeed test
