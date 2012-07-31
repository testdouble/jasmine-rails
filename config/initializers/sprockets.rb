require 'processes_jasmine_directives' ##<--TODO why is this here?
require 'jasmine' ##<--TODO why is this here?
require 'jasmine-core' ##<--TODO why is this here?

assets = Rails.application.assets

assets.register_preprocessor 'application/javascript', ProcessesJasmineDirectives
assets.register_preprocessor 'text/css', ProcessesJasmineDirectives

assets.append_path Jasmine::Config.new.spec_dir
assets.append_path Jasmine::Core.path