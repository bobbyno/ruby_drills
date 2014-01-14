# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_drills/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby_drills"
  gem.version       = RubyDrills::VERSION

  gem.authors       = ["Bobby Norton"]
  gem.email         = ["bobby@testedminds.com"]
  gem.description   = "A deliberate practice tool for the core Ruby API's."
  gem.summary       = gem.description
  gem.homepage      = "http://rubydrills.com"
  gem.license       = "Apache 2.0"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("pry",  "0.9.12.1")
  gem.add_dependency("colorize", "0.5.8")
  gem.add_dependency("httparty", "0.11.0")

  gem.add_development_dependency("rake", "10.0.4")
  gem.add_development_dependency("rspec", "~> 2.14.0.rc1")
  gem.add_development_dependency("wrong", "0.7.0")
end
