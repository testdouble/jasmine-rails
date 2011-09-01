require 'processes_jasmine_directives'
require 'jasmine'
require 'jasmine-core'

assets = Rails.application.assets

assets.register_preprocessor 'application/javascript', ProcessesJasmineDirectives
assets.register_preprocessor 'text/css', ProcessesJasmineDirectives

assets.append_path Jasmine::Config.new.spec_dir
assets.append_path Jasmine::Core.path