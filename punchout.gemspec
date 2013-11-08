require 'pathname'

Gem::Specification.new do |s|
  s.name        = "punchout"
  s.version     = "0.0.4"
  s.summary     = "A gem"

  s.license     = "MIT"

  s.authors     = ["Ed Carrel"]
  s.email       = ["ed@pocketchange.com"]
  

  s.files       = Pathname.glob('lib/**/*.rb').map(&:to_path)
  s.files       += Pathname.glob('test/**/*.rb').map(&:to_path)

  s.add_development_dependency 'active_support' 
  s.add_development_dependency 'mocha' 
  s.add_development_dependency 'simplecov'
end

