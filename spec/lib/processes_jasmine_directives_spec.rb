require 'processes_jasmine_directives'
require 'sprockets/context'
require 'gimme'
require 'jasmine'

describe ProcessesJasmineDirectives do
  ["css", "js"].each do |asset_type|
    describe "requiring Jasmine #{asset_type}" do
      Jasmine::Core.send("#{asset_type}_files").each do |f|
        let(:asset_file) {"/#{Jasmine::Core.path}/#{f}"}
        let(:context_double) {gimme(Sprockets::Context)}
        let(:target_object) {ProcessesJasmineDirectives.new}

        before {target_object.stub(:context => context_double)}

        it "requires Jasmine's #{f}" do
          target_object.process_require_jasmine_directive(asset_type)
          verify(context_double).require_asset(asset_file)
        end
      end
      
      describe "requiring user's #{asset_type}" do        
        user_asset_files = ["foo_asset", "bar_asset"]
        user_asset_files.each do |f|
          let(:jasmine_config) { gimme_next(Jasmine::Config) }
          let(:context_double) { gimme(Sprockets::Context) }
          let(:target_object) { ProcessesJasmineDirectives.new }

          before(:each) do
            Rails.stub(:root => "/some/path/to/where/rails/is/")
            @asset_file = "#{Rails.root}#{f}" 
            give(jasmine_config).send("#{asset_type}_files") { user_asset_files }
            target_object.stub(:context => context_double)
          end
          
          it "requires user's #{f}" do
            target_object.process_require_jasmine_directive(asset_type)
            verify(context_double).require_asset(@asset_file)
          end
        end
      end
    end
  end
end