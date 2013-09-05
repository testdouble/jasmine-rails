namespace :spec do

  desc "run test with phantomjs"
  task :javascript => [:environment] do
    require 'jasmine_rails/runner'
    spec_filter = ENV['SPEC']
    JasmineRails::Runner.run spec_filter
  end

  # alias
  task :javascripts => :javascript
end
