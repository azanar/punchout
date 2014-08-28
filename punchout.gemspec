require 'pathname'

Gem::Specification.new do |s|
  s.name        = "punchout"
  s.version     = "0.2.0"
  s.summary     = "A flexible registry pattern gem"
  s.description = "A flexible implementation of the Registry pattern, with an extensible finder/matcher mechanism."

  s.license     = "MIT"

  s.authors     = ["Ed Carrel"]
  s.email       = ["edward@carrel.org"]

  s.files       = Pathname.glob('lib/**/*.rb').map(&:to_path)
  s.files       += Pathname.glob('test/**/*.rb').map(&:to_path)

  s.add_development_dependency 'test-unit' 
  s.add_development_dependency 'mocha' 
  s.add_development_dependency 'simplecov'
end

