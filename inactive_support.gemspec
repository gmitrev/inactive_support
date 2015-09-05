# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inactive_support/version'

Gem::Specification.new do |spec|
  spec.name          = "inactive_support"
  spec.version       = InactiveSupport::VERSION
  spec.authors       = ["gmitrev"]
  spec.email         = ["gvmitrev@gmail.com"]
  spec.description   = %q{A collection of utilities and extensions}
  spec.summary       = %q{Snippets and useful stuff extracted from my projects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.3"
end
