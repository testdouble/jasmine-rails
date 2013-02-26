module JasmineRails
  module OfflineAssetPaths
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
end
