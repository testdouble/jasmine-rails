require "jasmine_rails/engine"

module JasmineRails
  DEFAULT_TMP_DIR = 'tmp/jasmine'
  class << self
    # return the relative path to access the spec runner
    # for the host Rails application
    # ex: /jasmine
    def route_path
      route = Rails.application.routes.named_routes[:jasmine_rails]
      raise 'JasmineRails::Engine has not been mounted. Try adding `mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)` to routes.rb' unless route
      path = route.path

      # Rails 3.1 support
      if path.is_a?(String)
        path
      else
        path.spec.to_s
      end
    end

    def spec_dir
      path = jasmine_config['spec_dir'] || 'spec/javascripts'
      Rails.root.join(path)
    end

    def tmp_dir
      path = jasmine_config['tmp_dir'] || JasmineRails::DEFAULT_TMP_DIR
      Rails.root.join(path)
    end

    # returns list of all files to be included into the jasmine testsuite
    # includes:
    # * application src_files
    # * spec helpers
    # * spec_files
    def spec_files
      files = []
      files += filter_files src_dir, jasmine_config['src_files']
      files += filter_files spec_dir, jasmine_config['helpers']
      files += filter_files spec_dir, jasmine_config['spec_files']
      files
    end

    # iterate over all directories used as part of the testsuite (including subdirectories)
    def each_spec_dir(&block)
      each_dir spec_dir.to_s, &block
      each_dir src_dir.to_s, &block
    end

    # clear out cached jasmine config file
    # it would be nice to automatically flush when the jasmine.yml file changes instead
    # of having this programatic API
    def reload_jasmine_config
      @config = nil
    end

    private

    def src_dir
      path = jasmine_config['src_dir'] || 'app/assets/javascripts'
      Rails.root.join(path)
    end

    def jasmine_config
      @config ||= begin
        path = Rails.root.join('config', 'jasmine.yml')
        path = Rails.root.join('spec', 'javascripts', 'support', 'jasmine.yml') unless File.exists?(path)
        initialize_jasmine_config_if_absent(path)
        YAML.load_file(path)
      end
    end

    def each_dir(root, &block)
      yield root
      Dir[root + '/*'].each do |file|
        if File.directory?(file)
          each_dir(file, &block)
        end
      end
    end

    def filter_files(root_dir, patterns)
      files = patterns.to_a.collect do |pattern|
        Dir.glob(root_dir.join(pattern)).sort
      end
      files = files.flatten
      files = files.collect {|f| f.gsub(root_dir.to_s + '/', '') }
      files || []
    end

  private

    def initialize_jasmine_config_if_absent(path)
      return if File.exist?(path)
      Rails.logger.warn("Initializing jasmine.yml configuration")
      FileUtils.mkdir_p(File.dirname(path))
      FileUtils.cp(File.join(File.dirname(__FILE__), 'generators', 'jasmine_rails', 'templates', 'jasmine.yml'), path)
    end
  end
end
