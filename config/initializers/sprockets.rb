assets = Rails.application.assets
assets.append_path Jasmine::Core.path
JasmineRails::JhwAdapter.new.asset_paths.each { |path| assets.append_path(path) }