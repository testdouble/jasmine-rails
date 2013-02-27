module JasmineRails
  module SpecRunnerHelper
    def jasmine_css_files
      %w{ jasmine.css }
    end
    def jasmine_js_files
      %w{ jasmine.js jasmine-html.js boot.js } + helper_js_files
    end

    def helper_js_files
      files = []
      if params[:console]
        files += %w{ jasmine-console-reporter.js }
      end
      files
    end

    def spec_js_files
      %w{ jasmine-specs.js }
    end
  end
end
