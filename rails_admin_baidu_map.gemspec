$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_baidu_map/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_baidu_map"
  s.version     = RailsAdminBaiduMap::VERSION
  s.authors     = ["TangMonk"]
  s.email       = ["wytwyt02@gmail.com"]
  s.summary     = "Add baidu baidu to rails admin"
  s.description = "Support PostGis And Mongoid"
  s.homepage    = "https://github.com/TangMonk/rails_admin_baidu_map"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
end
