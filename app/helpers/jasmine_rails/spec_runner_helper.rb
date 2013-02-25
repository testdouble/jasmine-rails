module JasmineRails
  module SpecRunnerHelper
    def jasmine_css_files
      %w{ jasmine.css }
    end
    def jasmine_js_files
      %w{ jasmine.js jasmine-html.js jasmine-boot.js } + helper_js_files
    end

    def helper_js_files
      filter_files JasmineRails.spec_dir, JasmineRails.jasmine_config['helpers']
    end

    def spec_js_files
      filter_files JasmineRails.spec_dir, JasmineRails.jasmine_config['spec_files']
    end

    private
    def filter_files(root_dir, patterns)
      patterns.to_a.collect do |pattern|
        Dir.glob(root_dir.join(pattern))
      end.flatten.collect {|f| f.gsub(root_dir.to_s + '/', '') }
    end
  end
end
