module JasmineRails
  class SpecRunnerController < JasmineRails::ApplicationController
    helper JasmineRails::SpecHelper rescue nil
    def index
      JasmineRails.reload_jasmine_config
    end

    def fixtures
      render file: "#{JasmineRails.fixtures_dir}/#{params[:filename]}.#{params[:format]}", layout: false
    end
  end
end
