require 'processes_jasmine_directives'

Rails.application.assets.register_preprocessor 'application/javascript', ProcessesJasmineDirectives
Rails.application.assets.register_preprocessor 'text/css', ProcessesJasmineDirectives