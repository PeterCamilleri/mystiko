# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mystiko/version'

Gem::Specification.new do |spec|
  spec.name          = "mystiko"
  spec.version       = Mystiko::VERSION
  spec.authors       = ["Peter Camilleri"]
  spec.email         = ["peter.c.camilleri@gmail.com"]

#  spec.summary       = "A introduction to the world of encryption."
#  spec.description   = "A brief primer on the fundamentals of encryption."

  spec.summary       = "A temp place holder."
  spec.description   = "A temp place holder. Work in progress."

  spec.homepage      = "http://teuthida-technologies.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(tests)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = '>=1.9.3'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest_visible', ">= 0.1.0"
  spec.add_development_dependency 'mini_readline', ">= 0.4.8"
end
