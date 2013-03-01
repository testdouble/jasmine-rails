module JasmineRails
  module SpecRunnerHelper
    def jasmine_css_files
      %w{ jasmine.css }
    end
    def jasmine_js_files
      files = %w{ json2.js jasmine.js jasmine-html.js }
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
