# jasmine-rails gem

[![Build Status](https://secure.travis-ci.org/searls/jasmine-rails.png)](http://travis-ci.org/searls/jasmine-rails)

This project is intended to make it a little easier to integrate [Jasmine](https://github.com/pivotal/jasmine/wiki) into your workflow, particularly if you're working in Rails 3.1 or later. (If you're on earlier versions of Rails, I'd suggest directly using the combination of Pivotal's [jasmine gem](https://github.com/pivotal/jasmine-gem) and [jasmine-headless-webkit](http://johnbintz.github.com/jasmine-headless-webkit/).)

By bundling this gem and configuring your project, you can expect to:

* Be able to run Jasmine specs in a browser (powered by Rails engine mounted into your application)
* Be able to run Jasmine specs from the command line (powered by
  [PhantomJS](http://phantomjs.org/))
* Write specs or source in [CoffeeScript](http://jashkenas.github.com/coffee-script/), leveraging the [asset pipeline](http://railscasts.com/episodes/279-understanding-the-asset-pipeline) to pre-process it

## Prerequisites

Install phantomjs in order to run tests headless on the command line. The easiest way (on a Mac) that I've found is to use [homebrew](https://github.com/mxcl/homebrew):

    brew install phantomjs

If you're not on a Mac, fear not, as [installing PhantomJS](http://phantomjs.org) is pretty painless for most environments. The important thing is that the binary be somewhere on your PATH.

## Installation

First, add jasmine-rails to your Gemfile, like so

    group :test, :development do
      gem 'jasmine-rails'
    end

Next, run `bundle install`.

Now, just mount jasmine-rails into your application by adding something like this to your routes.rb.  The engine can be mounted to any path that you choose.

``` ruby
mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
```

## Configuration

In order to run any specs, you'll need a Jasmine configuration in `spec/javascripts/support/jasmine.yml`. [Here's an example](https://github.com/searls/jasmine-rails/tree/master/spec/javascripts/support) from this repo's [dummy project](https://github.com/searls/jasmine-rails/tree/master/spec/dummy).

``` yaml
# path to parent directory of src_files
# relative path from Rails.root
# defaults to app/assets/javascripts
src_dir: "app/assets/javascripts"

# list of file expressions to include as source files
# relative path from scr_dir
src_files:
 - "application.{js,coffee}"

# path to parent directory of spec_files
# relative path from Rails.root
# defaults to spec/javascripts
spec_dir: spec/javascripts

# list of file expressions to include as helpers into spec runner
# relative path from spec_dir
helpers:
  - "helpers/**/*.{js,coffee}"

# list of file expressions to include as specs into spec runner
# relative path from spec_dir
spec_files:
  - "**/*[Ss]pec.{js,coffee}"
```

## Asset Pipeline Support

The jasmine-rails gem *fully* supports the Rails asset pipeline which means you can:
* use `coffee_script` or other Javascript precompilers for source or
  test files
* use sprockets directives to control inclusion/exclusion of dependent
  files
* leverage asset pipeline search paths to include assets from various
  sources/gems

**If you choose to use the asset pipeline support, many of the `jasmine.yml`
configurations become unnecessary** and you can rely on the Rails asset
pipeline to do the hard work of controlling what files are included in
your testsuite.

```yaml
# minimalist jasmine.yml configuration when leveraging asset pipeline
spec_files:
  - "**/*[Ss]pec.{js,coffee}"
```

You can write a spec to test Foo in `spec/javascripts/foo_spec.js`:

```javascript
// include spec/javascripts/helpers/spec_helper.js and app/assets/javascripts/foo.js
//= require helpers/spec_helper
//= require foo
describe('Foo', function() {
  it("does something", function() {
    expect(1 + 1).toBe(2);
  });
});
```

## Running from the command line

If you were to run:

    RAILS_ENV=test bundle exec rake spec:javascript

You'd hopefully see something like:

    Running Jasmine specs...

    PASS: 0 tests, 0 failures, 0.001 secs.

You can filter execution by passing the `SPEC` option as well:

    RAILS_ENV=test bundle exec rake spec:javascript SPEC=my_test

If you experience an error at this point, the most likely cause is JavaScript being loaded out of order, or otherwise conflicting with other existing JavaScript in your project. See "Debugging" below.

## Running from your browser

Startup your Rails server (ex: `bundle exec rails s`), and navigate to the path you have configured in your routes.rb file (ex: [http://localhost:3000/specs](http://localhost:3000/specs)).
The Jasmine spec runner should appear and start running your testsuite instantly.

## Debugging

### In your browser

In my workflow, I like to work with specs in the command line until I hit a snag and could benefit from debugging in [Web Inspector](http://www.webkit.org/blog/1091/more-web-inspector-updates/) or [Firebug](http://getfirebug.com/) to figure out what's going on.

### From the command line

Even though they both read from the same config file, it's certainly possible that your specs will pass in the browser and fail from the command line. In this case, you can try to debug or analyze what's going on loading the headless runner.html file into your browser environment. The generated runner.html file is written out to `spec/tmp/runner.html` after each run.

### Ajax / XHRs

As a general rule, Jasmine is designed for unit testing, and as a result real network requests are not appropriate for tests written in Jasmine. (Isolation strategies can include spying on asynchronous libraries and then synchronously testing callback behavior, as [demonstrated in this gist](https://gist.github.com/searls/946704)).

If your application code issues XHR requests during your test run, please note that **XHR requests for the local filesystem** are blocked by default for most browsers for security reasons.  To debug local XHR requests (for example, if you jasmine-jquery fixtures), you will need to enable local filesystem requests in your browser.

Example for Google Chrome (in Mac OS X):
    open -a "Google Chrome" spec/tmp/runner.html --args --allow-file-access-from-files

Again, it's the opinion of the present author that this shouldn't be necessary in any situation but legacy rescue of an existing test suite. With respect specifically to HTML fixtures, please consider [jasmine-fixture](https://github.com/searls/jasmine-fixture) and [my rationale](http://searls.testdouble.com/posts/2011-12-11-jasmine-fixtures.html) for it.
