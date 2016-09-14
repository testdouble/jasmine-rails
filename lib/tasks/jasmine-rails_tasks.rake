namespace :spec do

  desc "run test with phantomjs"
  task :javascript => [:environment] do
    if Rails.env.test?
      require 'jasmine_rails/runner'
      spec_filter = ENV['SPEC']
      reporters = ENV.fetch('REPORTERS', 'console')
      begin
        if ARGV.length > 1
          JasmineRails.files_to_run = ARGV.drop(1)
          JasmineRails.files_to_run.each{|i| task(i.to_sym) {} }
        end
        JasmineRails::Runner.run spec_filter, reporters
      ensure
        JasmineRails.files_to_run = nil
      end
    else
      exec("RAILS_ENV=test bundle exec rake spec:javascript #{ARGV.drop(1).join(" ")}")
    end
  end

  # alias
  task :javascripts => :javascript
end
