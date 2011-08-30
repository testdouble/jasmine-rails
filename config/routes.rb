JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
  
  Jasmine::Core.js_files.map do |f| 
    mount Rack::File.new("/#{Jasmine::Core.path}/#{f}"), :at => "lib/#{f}"
  end
end
