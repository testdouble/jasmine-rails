require 'jasmine-headless-webkit'

module JasmineRails

  class JhwAdapter

    def initialize
      @options = Jasmine::Headless::Options.new
      @runner = Jasmine::Headless::Runner.new(@options)
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
  end


  class JsFilesList < Jasmine::Headless::FilesList

    def self.default_files
      %w{jasmine.js jasmine-html}
    end

    def self.extension_filter
      extensions = (%w{.js} + Sprockets.engine_extensions)
      %r{(#{extensions.join('|')})$}
    end

  end

  class CssFilesList < Jasmine::Headless::FilesList

    def self.default_files
      %w{jasmine.css}
    end

    def self.extension_filter
      extensions = (%w{.css .scss .sass .less})
      %r{(#{extensions.join('|')})$}
    end
  end

end