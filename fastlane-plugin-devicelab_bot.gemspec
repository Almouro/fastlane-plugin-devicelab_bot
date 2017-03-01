# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/devicelab_bot/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-devicelab_bot'
  spec.version       = Fastlane::DevicelabBot::VERSION
  spec.author        = %q{Almouro}
  spec.email         = %q{contact@almouro.com}

  spec.summary       = %q{Automatically install your app on your devicelab with the devicelab bot}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-devicelab_bot"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '>= 1.0'
  spec.add_dependency 'rufus-scheduler', '~> 3.3'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.18.3'
end
