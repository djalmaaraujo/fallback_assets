# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fallback_assets/version'

Gem::Specification.new do |spec|
  spec.name          = "fallback_assets"
  spec.version       = FallbackAssets::VERSION
  spec.authors       = ["djalmaaraujo"]
  spec.email         = ["djalma.araujo@gmail.com"]
  spec.description   = %q{Easy to use helper to work with your assets}
  spec.summary       = %q{Create fallbacks to your assets. Helpful to work with development and cdn assets.}
  spec.homepage      = "https://github.com/djalmaaraujo/fallback_assets"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rspec'
end
