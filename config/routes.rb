require 'jasmine-core'
require 'jasmine'

JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
  
  # Jasmine::Core.js_files.map do |f| 
  #     map "lib/#{f}"
  #       Rack::File.new("/#{Jasmine::Core.path}/#{f}")
  #     end
  #   end 
end
