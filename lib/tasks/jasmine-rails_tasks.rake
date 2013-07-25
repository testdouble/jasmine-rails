namespace :spec do
  def run_cmd(cmd)
    puts "$ #{cmd}"
    unless system(cmd)
      raise "Error executing command: #{cmd}"
    end
  end

  desc "run test with phantomjs"
  task :javascript => :environment do
    original_debug_setting = Rails.application.config.assets.debug
    Rails.application.config.assets.debug = false
    require 'jasmine_rails/offline_asset_paths'
    if Rails::VERSION::MAJOR >= 4
      Sprockets::Rails::Helper.send :include, JasmineRails::OfflineAssetPaths
    else
      ActionView::AssetPaths.send :include, JasmineRails::OfflineAssetPaths
    end
    spec_filter = ENV['SPEC']
    app = ActionDispatch::Integration::Session.new(Rails.application)
    path = JasmineRails.route_path
    app.get path, :console => 'true', :spec => spec_filter
    JasmineRails::OfflineAssetPaths.disabled = true
    raise "Jasmine runner at '#{path}' returned a #{app.response.status} error: #{app.response.message}" unless app.response.success?
    html = app.response.body
    runner_path = Rails.root.join('spec/tmp/runner.html')
    File.open(runner_path, 'w') {|f| f << html.gsub('/assets', './assets')}

    run_cmd %{phantomjs "#{File.join(File.dirname(__FILE__), 'runner.js')}" "file://#{runner_path.to_s}?spec=#{spec_filter}"}
    Rails.application.config.assets.debug = original_debug_setting
  end

  # alias
  task :javascripts => :javascript
end
