require 'jasmine-core'

JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
  
  Jasmine::Core.js_files.each do |f| 
    mount Rack::File.new("/#{Jasmine::Core.path}/#{f}"), :at => "lib/#{f}"
  end
  
  Jasmine::Core.css_files.each do |f|
    mount Rack::File.new("/#{Jasmine::Core.path}/#{f}"), :at => "css/#{f}"
  end
  
end
