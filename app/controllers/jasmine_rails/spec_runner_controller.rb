module JasmineRails
  class SpecRunnerController < JasmineRails::ApplicationController
    def index
      JasmineRails.reload_jasmine_config
    end
  end
end
