$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jasmine_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jasmine-rails"
  s.version     = JasmineRails::VERSION
  s.authors     = ["Justin Searls", "Mark Van Holstyn", "Cory Flanigan"]
  s.email       = ["searls@gmail.com","mvanholstyn@gmail.com", "seeflanigan@gmail.com"]
  s.homepage    = "http://github.com/searls/jasmine-rails"
  s.summary     = "Makes Jasmine easier on Rails 3.2 & up"
  s.description = "Provides a Jasmine Spec Runner that plays nicely with Rails 3.2 assets and sets up jasmine-headless-webkit"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "railties", ">= 3.2.0"
  s.add_dependency "sprockets-rails"
  s.add_dependency "jasmine-core", [">= 1.3", "< 4.0"]
  s.add_dependency "phantomjs", ">= 1.9"

  if Gem.ruby_version >= Gem::Version.new("2.2.2")
    s.add_development_dependency "github_changelog_generator"
  end
end
