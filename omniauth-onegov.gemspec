# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-onegov/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-onegov"
  gem.version       = Omniauth::OneGov::VERSION
  gem.authors       = ["Nikhil Gupte"]
  gem.email         = ["nikhilgupte@gmail.com"]
  gem.description   = %q{Official OmniAuth strategy for OneGov.}
  gem.summary       = %q{Official OmniAuth strategy for OneGov.}
  gem.homepage      = "https://github.com/nikhilgupte/omniauth-onegov"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
end
