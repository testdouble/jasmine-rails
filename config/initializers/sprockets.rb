require 'processes_jasmine_directives'

assets = Rails.application.assets

assets.register_preprocessor 'application/javascript', ProcessesJasmineDirectives
assets.register_preprocessor 'text/css', ProcessesJasmineDirectives