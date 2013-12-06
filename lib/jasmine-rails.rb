require "jasmine_rails/engine"

module JasmineRails
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
      path = jasmine_config['tmp_dir'] || 'spec/tmp'
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
      File.open(path, 'w') do |f|
        f.write <<-YAML.gsub(/^\s{10}/,'')
          # path to parent directory of src_files
          # relative path from Rails.root
          # defaults to app/assets/javascripts
          src_dir: "app/assets/javascripts"

          # list of file expressions to include as source files
          # relative path from scr_dir
          src_files:
           - "application.{js,coffee}"

          # path to parent directory of spec_files
          # relative path from Rails.root
          # defaults to spec/javascripts
          spec_dir: spec/javascripts

          # list of file expressions to include as helpers into spec runner
          # relative path from spec_dir
          helpers:
            - "helpers/**/*.{js,coffee}"

          # list of file expressions to include as specs into spec runner
          # relative path from spec_dir
          spec_files:
            - "**/*[Ss]pec.{js,coffee}"

          # path to directory of temporary files
          # (spec runner and asset cache)
          # defaults to spec/tmp
          tmp_dir: "spec/tmp"
        YAML
      end

    end
  end
end
