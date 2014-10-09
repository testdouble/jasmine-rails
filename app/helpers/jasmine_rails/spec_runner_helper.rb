require 'jasmine-core'

module JasmineRails
  module SpecRunnerHelper
    # return list of css files to include in spec runner
    # all files are fetched through the Rails asset pipeline
    # includes:
    # * core jasmine css files
    def jasmine_css_files
      files = Jasmine::Core.css_files
      files << 'jasmine-specs.css'
      files
    end

    # return list of javascript files needed for jasmine testsuite
    # all files are fetched through the Rails asset pipeline
    # includes:
    # * core jasmine libraries
    # * (optional) reporter libraries
    # * jasmine-boot.js test runner
    # * jasmine-specs.js built by asset pipeline which merges application specific libraries and specs
    def jasmine_js_files
      files = Jasmine::Core.js_files
      files << jasmine_boot_file
      files += JasmineRails.reporter_files params[:reporters]
      files << 'jasmine-specs.js' unless requirejs_spec_loading?
      files
    end

    def jasmine_spec_files
      JasmineRails.spec_files
    end

    def jasmine_boot_file
      if JasmineRails.custom_boot
        JasmineRails.custom_boot

      elsif jasmine2?
        Jasmine::Core.boot_files.first

      else
        'jasmine-boot.js'

      end
    end

    def requirejs_spec_loading?
      defined?(Requirejs) ? true : false
    end

    def jasmine2?
      Jasmine::Core.respond_to?(:boot_files)
    end
  end
end
