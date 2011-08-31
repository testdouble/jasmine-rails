require 'jasmine-core'
require 'jasmine'

JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
  
  Jasmine::Core.js_files.each do |f| 
    mount Rack::File.new("/#{Jasmine::Core.path}/#{f}"), :at => "lib/js/#{f}"
  end
  
  Jasmine::Core.css_files.each do |f|
    mount Rack::File.new("/#{Jasmine::Core.path}/#{f}"), :at => "lib/css/#{f}"
  end
  
  jasmine_config = Jasmine::Config.new

  jasmine_config.css_files.each do |f|
    mount Rack::File.new("#{Rails.root}#{f}"), :at => "css/#{f}"
  end

  jasmine_config.js_files.each do |f|
    mount Rack::File.new("#{Rails.root}#{f}"), :at => "js/#{f}"
  end
    
  mount Rack::File.new(jasmine_config.spec_dir), :at => "js/"+jasmine_config.spec_path
  mount Rack::File.new(jasmine_config.project_root), :at => jasmine_config.root_path
  mount Rack::File.new(Jasmine.root), :at => '/__JASMINE_ROOT__'
end
