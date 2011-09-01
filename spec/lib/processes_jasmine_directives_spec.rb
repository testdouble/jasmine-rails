require 'processes_jasmine_directives'
require 'sprockets/context'
require 'gimme'
require 'jasmine'
require 'tempfile'

describe ProcessesJasmineDirectives do
  let(:target_object) { ProcessesJasmineDirectives.new(__FILE__) }
  let(:context_double) { gimme(Sprockets::Context) }
  let(:jasmine_config) { gimme_next(Jasmine::Config) }

  before(:each) do
    Rails.stub(:root => "/some/path/to/where/rails/is/")
    target_object.stub(:context => context_double) 
  end
  
  ["css", "js"].each do |asset_type|
    describe "requiring Jasmine #{asset_type}" do
      Jasmine::Core.send("#{asset_type}_files").each do |f|
        let(:asset_file) {"/#{Jasmine::Core.path}/#{f}"}

        it "requires Jasmine's #{f}" do
          target_object.process_require_jasmine_directive(asset_type)
          verify(context_double).require_asset(asset_file)
        end
      end
      
      describe "requiring user's #{asset_type}" do        
        user_asset_files = ["foo_asset", "bar_asset"]
        user_asset_files.each do |f|          
          before(:each) do
            give(jasmine_config).spec_path { "__spook__" }
            give(jasmine_config).spec_dir { "path/to" }
            give(jasmine_config).send("#{asset_type}_files") { user_asset_files }
          end
          
          it "requires user's #{f}" do
            target_object.process_require_jasmine_directive(asset_type)
            verify(context_double).require_asset("#{Rails.root}#{f}")
          end
        end
      end
      
    end 
  end
  
  describe "requiring a user's spec files" do
    it "converts the jasmine spec path to the spec dir" do
      give(jasmine_config).send("js_files") { ["my/__spook__/some_spec.js"] }
      give(jasmine_config).spec_path { "__spook__" }
      give(jasmine_config).spec_dir { "path/to" }
      
      target_object.process_require_jasmine_directive("js")
      
      verify(context_double).require_asset("my/path/to/some_spec.js")
    end
  end
  
end