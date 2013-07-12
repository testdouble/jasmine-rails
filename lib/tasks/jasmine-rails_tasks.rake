namespace :spec do

  desc "run test with phantomjs"
  task :javascript => [:environment] do
    override_rails_config do
      include_offline_asset_paths_helper
      spec_filter = ENV['SPEC']
      html = get_spec_runner(spec_filter)
      runner_path = Rails.root.join('spec/tmp/runner.html')
      File.open(runner_path, 'w') {|f| f << html.gsub('/assets', './assets')}

      run_cmd %{phantomjs "#{File.join(File.dirname(__FILE__), 'runner.js')}" "file://#{runner_path.to_s}?spec=#{spec_filter}"}
    end
  end

  def include_offline_asset_paths_helper
    require 'jasmine_rails/offline_asset_paths'
    if Rails::VERSION::MAJOR >= 4
      Sprockets::Rails::Helper.send :include, JasmineRails::OfflineAssetPaths
    else
      ActionView::AssetPaths.send :include, JasmineRails::OfflineAssetPaths
    end
  end

  def override_rails_config
    config = Rails.application.config

    original_asssets_debug = config.assets.debug
    config.assets.debug = false
    yield
    config.assets.debug = original_asssets_debug
  end

  def get_spec_runner(spec_filter)
    app = ActionController::Integration::Session.new(Rails.application)
    path = JasmineRails.route_path
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

  # alias
  task :javascripts => :javascript
end
