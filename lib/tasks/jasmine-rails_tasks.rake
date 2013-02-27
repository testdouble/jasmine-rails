namespace :spec do
  def run_cmd(cmd)
    puts "$ #{cmd}"
    unless system(cmd)
      raise "Error executing command: #{cmd}"
    end
  end

  desc "run test with phantomjs"
  task :javascript => :environment do
    require 'jasmine_rails/offline_asset_paths'
    ActionView::AssetPaths.send :include, JasmineRails::OfflineAssetPaths
    app = ActionController::Integration::Session.new(Rails.application)
    app.get '/jasmine', :console => 'true', :spec => ENV['SPEC']
    html = app.response.body
    runner_path = Rails.root.join('spec/tmp/runner.html')
    File.open(runner_path, 'w') {|f| f << html}

    run_cmd "phantomjs #{File.join(File.dirname(__FILE__), 'runner.js')} file://#{runner_path.to_s}"
  end

  # alias
  task :javascripts => :javascript
end
