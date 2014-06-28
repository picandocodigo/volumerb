# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volumerb/version'

Gem::Specification.new do |spec|
  spec.name          = "volumerb"
  spec.version       = Volumerb::VERSION
  spec.authors       = ["Fernando Briano"]
  spec.email         = ["fernando@picandocodigo.net"]
  spec.description   = %q{Gem to manage the computer's volume}
  spec.summary       = %q{Gem to manage the volume on GNU/Linux and Mac OS X operating systems}
  spec.homepage      = "https://github.com/picandocodigo/volumerb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.2"
  spec.add_development_dependency "minitest", "~> 5.3"
end
