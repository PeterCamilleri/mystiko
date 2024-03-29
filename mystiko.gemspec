# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mystiko/version'

Gem::Specification.new do |spec|
  spec.name          = "mystiko"
  spec.version       = Mystiko::VERSION
  spec.authors       = ["Peter Camilleri"]
  spec.email         = ["peter.c.camilleri@gmail.com"]

  spec.summary       = "A simple data security system."
  spec.description   = "An example of a simple data security system."

  spec.homepage      = "https://github.com/PeterCamilleri/mystiko"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(tests)/}) }
  spec.executables   = ["mystiko"]
  spec.require_paths = ["lib"]

  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.1.0'

  spec.add_runtime_dependency 'fibonacci_rng', "~> 2.0"
  spec.add_runtime_dependency 'composite_rng', "~> 0.1"

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency 'minitest', "~> 5.7"
  spec.add_development_dependency 'rdoc', "~> 5.0"

end
