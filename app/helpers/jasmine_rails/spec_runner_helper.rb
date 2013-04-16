require 'jasmine-core'

module JasmineRails
  module SpecRunnerHelper
    def jasmine_css_files
      Jasmine::Core.css_files
    end
    def jasmine_js_files
      files = Jasmine::Core.js_files
      if params[:console]
        files << 'jasmine-console-reporter.js'
      end
      files << 'jasmine-boot.js'
      files
    end

    def spec_js_files
      %w{ jasmine-specs.js }
    end
  end
end
