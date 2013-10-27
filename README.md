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

3. Obtain Google API Key from:


   [https://developers.google.com/speed/docs/insights/v1/getting_started#auth](https://developers.google.com/speed/docs/insights/v1/getting_started#auth)



##Pagespeed task
_Run this task with the `grunt pagespeed` command._

_This task is a [multi task][] so any targets, files and options should be specified according to the [multi task][] documentation._

[multi task]: https://github.com/gruntjs/grunt/wiki/Configuring-tasks


###Usage Example

```js
pagespeed: {
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
    },
    options: {
        key: "API_KEY",
        url: "https://developers.google.com"
    }
}
```

###Target Properties
####url
Type: `String`

The URL of the page for which the PageSpeed Insights API should generate results.

####locale
Type: `String`

The locale that results should be generated in.

####strategy
Type: `String`

The strategy to use when analyzing the page. Valid values are desktop and mobile.

####threshold
Type: `Number`

Threshold score that is needed to pass the pagespeed test

####paths
Type: `Array`

An array of URL paths that are appended to the URL

###Options

####key
Type: `String`

[Google API Key](https://code.google.com/apis/console/)

####url
Type: `String`

The URL of the page for which the PageSpeed Insights API should generate results.

###Sample output

The grunt task outputs the results as follows if everything passes:

![Passing task](http://www.jamescryer.com/img/pass.png)

If the task fails to pass the threshold, then it ouputs something similar to the image below:

![Failing task](http://www.jamescryer.com/img/fail.png)

##License

MIT
