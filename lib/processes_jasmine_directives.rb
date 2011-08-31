require 'jasmine-core'

class ProcessesJasmineDirectives
  
    # jasmine_config = Jasmine::Config.new
    # 
    # if asset_type == "css"
    #   require_jasmine_css
    #   require_user_css(jasmine_config)
    # else
    #   require_jasmine_javascript
    #   require_user_javascript(jasmine_config)
    # end
    
  def process_require_jasmine_directive(asset_type)
    return unless ["css", "js"].include?(asset_type)
     
    send("require_jasmine_#{asset_type}")
    send("require_user_#{asset_type}")
  end
  
  ["css", "js"].each do |asset_type|
    define_method "require_jasmine_#{asset_type}" do
      Jasmine::Core.send("#{asset_type}_files").each do |f|
        context.require_asset "/#{Jasmine::Core.path}/#{f}"
      end
    end
    
    define_method "require_user_#{asset_type}" do
      config = Jasmine::Config.new
      config.send("#{asset_type}_files").each do |f|
        asset_file = if f.include?(config.spec_path)
          f.gsub(/#{config.spec_path}/,config.spec_dir)
        else
          "#{Rails.root}#{f}"
        end
        context.require_asset asset_file
      end
    end
  end
end
