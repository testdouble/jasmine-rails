module JasmineRails
  class SpecRunnerController < ApplicationController
    def index
      params[:debug_assets] = true
    end
  end
end
