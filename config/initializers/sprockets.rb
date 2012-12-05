require 'jasmine'
require 'jasmine-core'

assets = Rails.application.assets

assets.append_path Jasmine.config.spec_path
assets.append_path Jasmine::Core.path
