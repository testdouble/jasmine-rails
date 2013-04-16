require "jasmine_rails/engine"

module JasmineRails
  class << self
    def spec_dir
      path = jasmine_config['spec_dir'] || 'spec/javascripts'
      Rails.root.join(path)
    end

    # returns list of configured stylesheets from jasmine.yml config
    def css_files
      filter_files src_dir, jasmine_config['stylesheets']
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

    private

    def src_dir
      path = jasmine_config['src_dir'] || ''
      Rails.root.join(path)
    end

    def jasmine_config
      jasmine_config ||= begin
        path = Rails.root.join('spec', 'javascripts', 'support', 'jasmine.yml')
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
  end
end
