# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ecogem/version'

Gem::Specification.new do |spec|
  spec.name          = "ecogem"
  spec.version       = Ecogem::VERSION
  spec.authors       = ["mosop"]
  spec.email         = [""]
  spec.summary       = %q{Supplements Bundler for installing private gems.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/moso2p/ecogem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 1.7.9"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
