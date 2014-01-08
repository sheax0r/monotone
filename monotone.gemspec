# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monotone/version'

Gem::Specification.new do |spec|
  spec.name          = 'monotone'
  spec.version       = Monotone::VERSION
  spec.authors       = ['Michael Shea']
  spec.email         = ['mike.shea@gmail.com']
  spec.description   = %q{Generates increasing numbers, stored on the filesystem.}
  spec.summary       = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w'lib'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
