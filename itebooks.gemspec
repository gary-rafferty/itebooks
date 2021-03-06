# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itebooks/version'

Gem::Specification.new do |spec|
  spec.name          = "itebooks"
  spec.version       = Itebooks::VERSION
  spec.authors       = ["Gary Rafferty"]
  spec.email         = ["gary.rafferty@gmail.com"]
  spec.summary       = %q{Ruby client for the IT-Ebooks API}
  spec.description   = %q{Ruby client for the IT-Ebooks API}
  spec.homepage      = "https://github.com/gary-rafferty/itebooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
