require 'jasmine-core'
require 'jasmine'

JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
end
