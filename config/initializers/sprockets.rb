require 'processes_jasmine_directives'
require 'jasmine'
require 'jasmine-core'
require 'yaml'

assets = Rails.application.assets

assets.register_preprocessor 'application/javascript', ProcessesJasmineDirectives
assets.register_preprocessor 'text/css', ProcessesJasmineDirectives

jasmine_opts = YAML.load_file(Rails.root + 'config/jasmine.yml')

assets.append_path "#{Rails.root}/#{jasmine_opts['spec_dir']}"
assets.append_path Jasmine::Config.new.spec_dir
assets.append_path Jasmine::Core.path