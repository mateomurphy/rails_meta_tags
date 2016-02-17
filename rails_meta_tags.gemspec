# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/meta_tags/version'

Gem::Specification.new do |spec|
  spec.name = "rails_meta_tags"
  spec.version = Rails::MetaTags::VERSION
  spec.authors = ["Mateo Murphy"]
  spec.email = ["mateo.murphy@gmail.com"]

  spec.summary = "Metatag library for rails"
  spec.description = "Easily manage your meta tags in rails projects"
  spec.homepage = "https://github.com/mateomurphy/rails_meta_tags"
  spec.license = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.11.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.13.0"
end
