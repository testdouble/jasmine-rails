module JasmineRails
  class SpecRunnerController < ApplicationController
    def index
      params[:debug_assets] = true unless params[:console]
    end
  end
end
