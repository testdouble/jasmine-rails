module JasmineOfflineAssetPaths
  extend ActiveSupport::Concern
  included do
    alias_method_chain :compute_public_path, :offline_asset
  end

  def compute_public_path_with_offline_asset(source, dir, options={})
    return source if source.starts_with?('/')
    content = Rails.application.assets[source].to_s
    source_path = offline_asset_dir.join(source)

    FileUtils.mkdir_p File.dirname(source_path)
    Rails.logger.debug "Compiling #{source} to #{source_path}"
    File.open(source_path, 'w') {|f| f << content }
    "assets/#{source}"
  end

  private
  def offline_asset_dir
    Rails.root.join('spec/tmp/assets')
  end
end

namespace :spec do
  def run_cmd(cmd)
    puts "$ #{cmd}"
    unless system(cmd)
      abort("Error executing command: #{cmd}")
    end
  end

  desc "run test with phantomjs"
  task :javascript => :environment do
    ActionView::AssetPaths.send :include, JasmineOfflineAssetPaths
    app = ActionController::Integration::Session.new(Rails.application)
    app.get '/jasmine', :console => 'true', :spec => ENV['SPEC']
    html = app.response.body
    runner_path = Rails.root.join('spec/tmp/runner.html')
    File.open(runner_path, 'w') {|f| f << html}

    run_cmd "phantomjs #{File.join(File.dirname(__FILE__), 'runner.js')} file://#{runner_path.to_s}"
  end
end
