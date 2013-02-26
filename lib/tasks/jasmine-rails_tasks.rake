module JasmineOfflineAssetPaths
  extend ActiveSupport::Concern
  included do
    alias_method_chain :compute_public_path, :offline_asset
  end

  def compute_public_path_with_offline_asset(source, dir, options={})
    return source if source.starts_with?('/')
    spec_assets_dir = Rails.root.join('spec/tmp/assets/')
    content = Rails.application.assets[source].to_s
    source_path = spec_assets_dir.join(source)

    FileUtils.mkdir_p File.dirname(source_path)
    File.open(source_path, 'w') {|f| f << content }
    source_path.to_s
  end
end

namespace :jasmine do
  desc "run test with phantomjs"
  task :phantom => :environment do
    tmp_asset_dir = Rails.root.join('spec/tmp/assets')

    FileUtils.mkdir_p tmp_asset_dir

    ActionView::AssetPaths.send :include, JasmineOfflineAssetPaths
    app = ActionController::Integration::Session.new(Rails.application)
    app.get '/jasmine'
    html = app.response.body
    File.open(Rails.root.join('spec/tmp/runner.html'), 'w') {|f| f << html}
  end
end
