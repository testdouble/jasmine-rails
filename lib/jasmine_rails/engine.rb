require 'jasmine'

module JasmineRails
  class Engine < Rails::Engine
    isolate_namespace JasmineRails

    initializer :assets do |config|
      Rails.application.config.assets.paths << Jasmine::Core.path
      Rails.application.config.assets.paths << JasmineRails.spec_dir
    end
  end
end
