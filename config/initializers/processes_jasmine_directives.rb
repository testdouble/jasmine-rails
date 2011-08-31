require 'jasmine'
require 'jasmine-core'

class ProcessesJasmineDirectives < Sprockets::DirectiveProcessor
  def process_require_jasmine_directive(asset_type)
    jasmine_config = Jasmine::Config.new
    
    if asset_type == "css"
      require_jasmine_css
      require_user_css(jasmine_config)
    else
      require_jasmine_javascript
      require_user_javascript(jasmine_config)
    end
  end
  
  private
  
  def require_jasmine_css
    Jasmine::Core.css_files.each do |f|
      context.require_asset "/#{Jasmine::Core.path}/#{f}"
    end
  end
  
  def require_user_css(config)
    config.css_files.each do |f|
      require_asset "#{Rails.root}#{f}"
    end
  end
  
  def require_jasmine_javascript
    Jasmine::Core.js_files.map do |f|
      context.require_asset "/#{Jasmine::Core.path}/#{f}"
    end
  end
  
  def require_user_javascript(jasmine_config)
    jasmine_config.js_files.each do |file_path| 
      context.require_asset resolve_user_javascript_path(file_path,jasmine_config)
    end
  end
  
  def resolve_user_javascript_path(file_path,config)
    if file_path.include? config.spec_path
      file_path.gsub(/#{config.spec_path}/,config.spec_dir)
    else 
      "#{Rails.root}#{file_path}"
    end  
  end
  
end

Rails.application.assets.register_preprocessor 'application/javascript', ProcessesJasmineDirectives
Rails.application.assets.register_preprocessor 'text/css', ProcessesJasmineDirectives