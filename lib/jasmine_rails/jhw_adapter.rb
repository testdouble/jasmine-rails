require 'jasmine-headless-webkit'

module JasmineRails

  class JhwAdapter

    def initialize
      @options = Jasmine::Headless::Options.new
      @runner = instantiate_runner
      Jasmine::Headless::CacheableAction.enabled = @options[:enable_cache]
    end

    def css_files
      @css_files_list ||= CssFilesList.new(
        :config => @runner.jasmine_config,
        :only => @options[:files],
        :seed => @options[:seed]
      ).files
    end

    def js_files
      @js_files_list ||= JsFilesList.new(
        :config => @runner.jasmine_config,
        :only => @options[:files],
        :seed => @options[:seed]
      ).files
    end

    def asset_paths
      jasmine_config = YAML.load_file(@options[:jasmine_config])
      [
        jasmine_config["src_dir"],
        jasmine_config["spec_dir"],
        jasmine_config["asset_paths"]
      ].flatten.compact
    end

    def instantiate_runner
      begin
        Jasmine::Headless::Runner.new(@options)
      rescue Jasmine::Headless::NoRunnerError
        require 'fileutils'
        FileUtils.touch(Jasmine::Headless::Runner::RUNNER)
        Jasmine::Headless::Runner.new(@options).tap { File.delete(Jasmine::Headless::Runner::RUNNER) }
      end
    end
  end

  class DistinctifiedFileList < Jasmine::Headless::FilesList
    def files
      required_files.collect { |asset| asset.pathname.to_s }.uniq
    end
  end

  class JsFilesList < DistinctifiedFileList

    def self.default_files
      %w{jasmine.js jasmine-html}
    end

    def self.extension_filter
      extensions = (%w{.js} + Sprockets.engine_extensions)
      %r{(#{extensions.join('|')})$}
    end

  end

  class CssFilesList < DistinctifiedFileList

    def self.default_files
      %w{jasmine.css}
    end

    def self.extension_filter
      extensions = (%w{.css .scss .sass .less})
      %r{(#{extensions.join('|')})$}
    end
  end

end