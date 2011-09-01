$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jasmine_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jasmine-rails"
  s.version     = JasmineRails::VERSION
  s.authors     = ["Justin Searls", "Mark Van Holstyn"]
  s.email       = ["searls@gmail.com","mvanholstyn@gmail.com"]
  s.homepage    = "http://github.com/searls/jasmine-rails"
  s.summary     = "Provides a Jasmine Spec Runner that plays nicely with Rails 3.1 assets and jasmine-headless-webkit"
  s.description = "Provides a Jasmine Spec Runner that plays nicely with Rails 3.1 assets and jasmine-headless-webkit"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "jasmine"
  s.add_dependency "jasmine-headless-webkit"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "gimme"
end
