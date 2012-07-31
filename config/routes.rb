require 'jasmine-core' ##<--TODO why is this here?
require 'jasmine' ##<--TODO why is this here?

JasmineRails::Engine.routes.draw do
  root :to => "spec_runner#index"
end
