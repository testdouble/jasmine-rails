JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
  get "#{JasmineRails.fixtures_path}/*filename", :to => "spec_runner#fixtures"
  get "spec/#{JasmineRails.fixtures_path}/*filename", :to => "spec_runner#fixtures"
end
