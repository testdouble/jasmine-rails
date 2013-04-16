require 'jasmine-core'

module JasmineRails
  module SpecRunnerHelper
    # return list of css files to include in spec runner
    # all files are fetched through the Rails asset pipeline
    # includes:
    # * core jasmine css files
    def jasmine_css_files
      Jasmine::Core.css_files
    end

    # return list of javascript files needed for jasmine testsuite
    # all files are fetched through the Rails asset pipeline
    # includes:
    # * core jasmine libraries
    # * (optional) jasmine-console-reporter.js for CLI output
    # * jasmine-boot.js test runner
    # * jasmine-specs.js built by asset pipeline which merges application specific libraries and specs
    def jasmine_js_files
      files = Jasmine::Core.js_files
      if params[:console]
        files << 'jasmine-console-reporter.js'
      end
      files << 'jasmine-boot.js'
      files << 'jasmine-specs.js'
      files
    end
  end
end
