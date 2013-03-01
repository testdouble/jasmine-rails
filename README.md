# jasmine-rails gem

[![Build Status](https://secure.travis-ci.org/searls/jasmine-rails.png)](http://travis-ci.org/searls/jasmine-rails)

This project is intended to make it a little easier to integrate [Jasmine](https://github.com/pivotal/jasmine/wiki) into your workflow, particularly if you're working in Rails 3.1 or later. (If you're on earlier versions of Rails, I'd suggest directly using the combination of Pivotal's [jasmine gem](https://github.com/pivotal/jasmine-gem) and [jasmine-headless-webkit](http://johnbintz.github.com/jasmine-headless-webkit/).)

By bundling this gem and configuring your project, you can expect to:

* Be able to run Jasmine specs in a browser (wherever you choose to mount the jasmine-rails engine)
* Be able to run Jasmine specs from the command line (powered by
  [PhantomJS](http://phantomjs.org/)
* Write specs or source in [CoffeeScript](http://jashkenas.github.com/coffee-script/), leveraging the [asset pipeline](http://railscasts.com/episodes/279-understanding-the-asset-pipeline) to pre-process it

## Prerequisites

Install phantomjs for its headless webkit widget. The easiest way (on a Mac) that I've found is to use [homebrew](https://github.com/mxcl/homebrew):

    brew install phantomjs

## Adding & configuring the gem

First, add jasmine-rails to your Gemfile, like so

    group :test, :development do
      gem 'jasmine-rails'
    end

Next, run `bundle install`.

In order to run any specs, you'll need a Jasmine configuration in `spec/javascripts/support/jasmine.yml`. [Here's an example](https://github.com/searls/jasmine-rails/tree/master/spec/dummy/spec/javascripts/support) from this repo's [dummy project](https://github.com/searls/jasmine-rails/tree/master/spec/dummy).

``` yaml
src_files:
 - "application.{js,coffee}"

stylesheets:

helpers:
  - "helpers/**/*.{js,coffee}"

spec_files:
  - "**/*[Ss]pec.{js,coffee}"

src_dir: "app/assets/javascripts"

spec_dir: spec/javascripts

asset_paths:
 - "vendor/assets/javascripts"
```

### Writing asset manifests

I prefer to have just one asset manifest per project, as the `jasmine.yml` file above suggests. One way to accomplish that is to require your `vendor` (and, if necessary, `lib`) manifests within your application manifest. For an example, check out the repo's [dummy project](https://github.com/searls/jasmine-rails/tree/master/spec/dummy).

Here's `app/assets/javascripts/application.js`

``` javascript
//= require vendor
//= require_tree .
```

And here's `vendor/assets/javascripts/vendor.js` (as referenced on the first line of `application.js` above)

``` javascript
//= require jquery
//= require jquery_ujs
//= require_tree .
```

Assets in gems come along for the ride, as well. Additionally, you can follow a similar scheme to import any JavaScript libs you might reference from a `lib/assets/javascripts/lib.js` manifest file.

## Running from the command line

If you were to run:

    bundle exec rake spec:javascript

You'd hopefully see something like:

    Running Jasmine specs...

    PASS: 0 tests, 0 failures, 0.001 secs.

If you experience an error at this point, the most likely cause is JavaScript being loaded out of order, or otherwise conflicting with other existing JavaScript in your project. See "Debugging" below.

You can filter execution by passing the `SPEC` option as well:

    bundle exec rake spec:javascript SPEC=my_test

## Running from your browser

Just mount jasmine-rails by adding something like this to your routes.rb:

``` ruby
mount JasmineRails::Engine => "/jasmine" unless Rails.env.production?
```

Now when you run `bundle exec rails s`, and navigate to [http://localhost:3000/jasmine](http://localhost:3000/jasmine), you should see a Jasmine spec runner in your browser.

## Debugging

### In your browser

In my workflow, I like to work with specs in the command line until I hit a snag and could benefit from debugging in [Web Inspector](http://www.webkit.org/blog/1091/more-web-inspector-updates/) or [Firebug](http://getfirebug.com/) to figure out what's going on.

### From the command line

Even though they both read from the same config file, it's certainly possible that your specs will pass in the browser and fail from the command line. In this case, you can try to debug or analyze what's going on loading the headless runner.html file into your browser environment. The generated runner.html file is written out to `spec/tmp/runner.html` after each run.

NOTE: XHR requests for local filesystem are blocked by default for most browsers for security reasons.  To debug local XHR requests (ex: jasmine-jquery fixtures), you will need to enable local filesystem requests in your browser.

Example for Google Chrome:
    open -a "Google Chrome" spec/tmp/runner.html --args --allow-file-access-from-files
