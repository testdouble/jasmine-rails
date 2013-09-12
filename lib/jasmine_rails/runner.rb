require 'jasmine_rails/offline_asset_paths'

module JasmineRails
  module Runner
    class << self
      # Run the Jasmine testsuite via phantomjs CLI
      # raises an exception if any errors are encountered while running the testsuite
      def run(spec_filter = nil)
        override_rails_config do
          include_offline_asset_paths_helper
          html = get_spec_runner(spec_filter)
          runner_path = Rails.root.join('spec/tmp/runner.html')
          File.open(runner_path, 'w') {|f| f << html.gsub('/assets', './assets')}

          phantomjs_runner_path = File.join(File.dirname(__FILE__), '..', 'assets', 'javascripts', 'jasmine-runner.js')
          run_cmd %{phantomjs "#{phantomjs_runner_path}" "file://#{runner_path.to_s}?spec=#{spec_filter}"}
        end
      end

      private
      def include_offline_asset_paths_helper
        if Rails::VERSION::MAJOR >= 4
          Sprockets::Rails::Helper.send :include, JasmineRails::OfflineAssetPaths
        else
          ActionView::AssetPaths.send :include, JasmineRails::OfflineAssetPaths
        end
      end

      # temporarily override internal rails settings for the given block
      # and reset the settings after work is complete.
      #
      # * disable Rails assets debug setting to ensure generated application
      # is built into one JS file
      # * disable asset host so that generated runner.html file uses
      # relative paths to included javascript files
      def override_rails_config
        config = Rails.application.config

        original_assets_debug = config.assets.debug
        original_assets_host = ActionController::Base.asset_host
        config.assets.debug = false
        ActionController::Base.asset_host = nil
        yield
      ensure
        config.assets.debug = original_assets_debug
        ActionController::Base.asset_host = original_assets_host
      end

      def get_spec_runner(spec_filter)
        app = ActionDispatch::Integration::Session.new(Rails.application)
        path = JasmineRails.route_path
        JasmineRails::OfflineAssetPaths.disabled = false
        app.get path, :console => 'true', :spec => spec_filter
        JasmineRails::OfflineAssetPaths.disabled = true
        raise "Jasmine runner at '#{path}' returned a #{app.response.status} error: #{app.response.message}" unless app.response.success?
        app.response.body
      end

      def run_cmd(cmd)
        puts "Running `#{cmd}`"
        unless system(cmd)
          raise "Error executing command: #{cmd}"
        end
      end
    end
  end
end
