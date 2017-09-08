# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rocketfuel_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'rocketfuel_api'
  spec.version       = RocketfuelApi::VERSION
  spec.authors       = ['Stefan Greffenius']
  spec.email         = ['stefan.greffenius@ad2games.com']

  spec.summary       = 'Rocketfuel API Client.'
  spec.description   = 'Rocketfuel API Client.'
  spec.homepage      = 'https://www.rocketfuel.com'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
