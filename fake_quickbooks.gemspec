# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_quickbooks/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_quickbooks"
  spec.version       = FakeQuickbooks::VERSION
  spec.authors       = ["Jordan Graft"]
  spec.email         = ["jordan@cratebind.com"]
  spec.summary       = %q{Provides a Fake Quickbooks Sinatra wrapper to serve XML response}
  spec.description   = %q{Provides a Fake Quickbooks Sinatra wrapper to serve XML response}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "webmock"
end
