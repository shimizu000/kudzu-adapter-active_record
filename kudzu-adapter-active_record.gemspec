$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kudzu/adapter/active_record/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kudzu-adapter-active_record"
  s.version     = Kudzu::Adapter::ActiveRecord::VERSION
  s.authors     = ["Yoshikazu Kaneta"]
  s.email       = ["kaneta@sitebridge.co.jp"]
  s.homepage    = "https://github.com/kanety/kudzu-adapter-active_record"
  s.summary     = "ActiveRecord adapter for kudzu crawler"
  s.description = "ActiveRecord adapter for kudzu crawler"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "kudzu"
  s.add_dependency "activerecord"
  s.add_dependency "activerecord-import"

  s.add_development_dependency "rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "database_cleaner"
end
