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
  end
end
