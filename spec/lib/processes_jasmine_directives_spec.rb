require 'processes_jasmine_directives'
require 'sprockets/context'
require 'gimme'

describe ProcessesJasmineDirectives do
  ["css", "js"].each do |asset_type|
    describe "requiring #{asset_type}" do
      Jasmine::Core.send("#{asset_type}_files").each do |f|
        let(:asset_file) {"/#{Jasmine::Core.path}/#{f}"}
        let(:context_double) {gimme(Sprockets::Context)}
        let(:target_object) {ProcessesJasmineDirectives.new}

        before {target_object.stub(:context => context_double)}

        it "requires #{f}" do
          target_object.process_require_jasmine_directive(asset_type)
          verify(context_double).require_asset(asset_file)
        end
      end
    end
  end
end