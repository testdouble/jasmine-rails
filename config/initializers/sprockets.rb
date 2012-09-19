require 'jasmine'
require 'jasmine-core'

assets = Rails.application.assets

assets.append_path Jasmine::Config.new.spec_dir
assets.append_path Jasmine::Core.path