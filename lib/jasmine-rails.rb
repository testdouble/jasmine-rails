require "jasmine_rails/engine"

module JasmineRails
  class << self
    def spec_dir
      path = jasmine_config['spec_dir'] || 'spec/javascripts'
      Rails.root.join(path)
    end

    def jasmine_config
      jasmine_config ||= begin
        path = Rails.root.join('spec', 'javascripts', 'support', 'jasmine.yml')
        YAML.load_file(path)
      end
    end

    def spec_files
      filter_files JasmineRails.spec_dir, JasmineRails.jasmine_config['spec_files']
    end

    private
    def filter_files(root_dir, patterns)
      files = patterns.to_a.collect do |pattern|
        Dir.glob(root_dir.join(pattern))
      end
      files = files.flatten
      files = files.collect {|f| f.gsub(root_dir.to_s + '/', '') }
      files || []
    end
  end
end
