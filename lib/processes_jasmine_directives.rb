require 'jasmine-core'
require 'sprockets/directive_processor'

class ProcessesJasmineDirectives < Sprockets::DirectiveProcessor
  ASSET_TYPES = ["css","js"]
  
  def process_require_jasmine_directive(asset_type)
    return unless ASSET_TYPES.include?(asset_type)
     
    send("require_jasmine_#{asset_type}")
    send("require_user_#{asset_type}")
  end
  
  ASSET_TYPES.each do |asset_type|
    define_method "require_jasmine_#{asset_type}" do
      Jasmine::Core.send("#{asset_type}_files").each do |f|
        context.require_asset "/#{Jasmine::Core.path}/#{f}"
      end
    end
    
    define_method "require_user_#{asset_type}" do
      config = Jasmine::Config.new
      config.send("#{asset_type}_files").each do |f|
        context.require_asset full_path_for(f,config)
      end
    end
  end
  
  private 
  
  def full_path_for(partial_path,config)
    if partial_path.include?(config.spec_path)
      partial_path.gsub(/#{config.spec_path}/,config.spec_dir)
    else
      "#{Rails.root}#{partial_path}"
    end
  end
end
