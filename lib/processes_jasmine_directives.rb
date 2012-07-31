require 'jasmine-core'
require 'sprockets/directive_processor'

class ProcessesJasmineDirectives < Sprockets::DirectiveProcessor
  def process_require_jasmine_directive(asset_type)
    reset_circular_dependencies
    context.depend_on(Rails.root)
    JasmineRails::JhwAdapter.new.send("#{asset_type}_files").each do |full_path|
      context.depend_on(full_path)
      context.require_asset(full_path)
    end
  end

  private

  def reset_circular_dependencies
    #This is an internal thread-local variable Sprockets uses.
    # Unfortunately, it's the only way I've found to avoid
    # (seemingly) spurious `CircularDependencyError`s from being
    # raised whenever a file changes.
    Thread.current[:sprockets_circular_calls] = nil
  end

end
