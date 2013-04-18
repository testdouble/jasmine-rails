module JasmineRails
  class SpecRunnerController < ApplicationController
    def index
      JasmineRails.reload_jasmine_config
    end
  end
end
