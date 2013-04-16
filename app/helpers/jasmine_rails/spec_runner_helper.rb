require 'jasmine-core'

module JasmineRails
  module SpecRunnerHelper
    # return list of css files to include in spec runner
    # includes:
    # * core jasmine css files
    # * application specific css files defined in jasmine.yml stylesheets config
    def jasmine_css_files
      files = Jasmine::Core.css_files
      files += JasmineRails.css_files
      files
    end

    # return list of javascript files needed for jasmine testsuite
    # includes:
    # * core jasmine libraries
    # * jasmine-boot.js test runner
    # * application specific libraries and specs (jasmine-specs.js)
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
