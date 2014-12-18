# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dicebag/version'

Gem::Specification.new do |spec|
  spec.name          = "dicebag"
  spec.version       = Dicebag::VERSION
  spec.authors       = ["Matt Hink"]
  spec.email         = ["mhink1103@gmail.com"]
  spec.summary       = %q{D&D-style dice rolling, in Ruby}
  spec.homepage      = "https://github.com/mhink/dicebag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
