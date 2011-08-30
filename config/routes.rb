require 'jasmine-core'

JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
  
  debugger
  Jasmine::Core.js_files.map do |f| 
    map "lib/#{f}" do
      Rack::File.new("/#{Jasmine::Core.path}/#{f}")
    end
  end 
end
