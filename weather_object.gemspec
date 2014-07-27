# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'weather_object/version'

Gem::Specification.new do |spec|
  spec.name          = 'weather_object'
  spec.version       = WeatherObject::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Mark Gangl']
  spec.email         = ['mark@attackcorp.com']
  spec.description   = 'Ruby object for Weather data'
  spec.summary       = spec.description
  spec.homepage      = 'http://github.com/attack/weather_object'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_dependency 'virtus', '>= 1.0.0'
  spec.add_dependency 'tzinfo', '>= 0.3.14'

  spec.add_development_dependency 'bundler'
end
