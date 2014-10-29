# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wingtips/version'

Gem::Specification.new do |spec|
  spec.name          = "wingtips"
  spec.version       = Wingtips::VERSION
  spec.authors       = ["Tobias Pfiffer, Jason R. Clark"]
  spec.email         = ["jason@jasonrclark.net"]
  spec.summary       = %q{Presentation software for Shoes}
  spec.description   = %q{Put your best foot forward, present with Shoes!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Currently only works from source
  #spec.add_dependency "shoes", path: "../shoes4" #"~> 4.0.0.pre2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "pry",     "~> 0.10.0"
end
