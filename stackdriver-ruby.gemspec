# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stackdriver/version'

Gem::Specification.new do |spec|
  spec.name          = 'stackdriver-ruby'
  spec.version       = Stackdriver::VERSION
  spec.authors       = ['Brian Balser']
  spec.email         = ['balser.brian@gmail.com']
  spec.summary       = %q{A ruby client for Stackdriver metrics.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',    '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency     'multi_json', '~> 1.8'
  spec.add_runtime_dependency     'faraday',    '~> 0.9'
end
