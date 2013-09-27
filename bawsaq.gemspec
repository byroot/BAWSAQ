# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bawsaq/version'

Gem::Specification.new do |spec|
  spec.name          = "bawsaq"
  spec.version       = BAWSAQ::VERSION
  spec.authors       = ["Jean Boussier"]
  spec.email         = ["jean.boussier@gmail.com"]
  spec.description   = %q{Library to access GTA V BAWSAQ stock prices}
  spec.summary       = %q{Library to access GTA V BAWSAQ stock prices}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'faraday'
  spec.add_dependency 'multi_json'
end
