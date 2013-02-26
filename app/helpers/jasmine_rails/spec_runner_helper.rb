module JasmineRails
  module SpecRunnerHelper
    def jasmine_css_files
      %w{ jasmine.css }
    end
    def jasmine_js_files
      %w{ jasmine.js jasmine-html.js jasmine-boot.js } + helper_js_files
    end

    def helper_js_files
      files = filter_files JasmineRails.spec_dir, JasmineRails.jasmine_config['helpers']
      if params[:console]
        files += %{ jasmine-console-reporter.js jasmine-console-boot.js }
        files += filter_files(JasmineRails.spec_dir, JasmineRails.jasmine_config['console_helpers'])
      end
      files
    end

    def spec_js_files
      files = filter_files JasmineRails.spec_dir, JasmineRails.jasmine_config['spec_files']
      if filter = params[:spec].to_s.split.first
        files = files.select do |file|
          file.include? filter
        end
      end
      files
    end

    private
    def filter_files(root_dir, patterns)
      patterns.to_a.collect do |pattern|
        Dir.glob(root_dir.join(pattern))
      end.flatten.collect {|f| f.gsub(root_dir.to_s + '/', '') }
    end
  end
end
