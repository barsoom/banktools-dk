# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "banktools-dk/version"

Gem::Specification.new do |spec|
  spec.name          = "banktools-dk"
  spec.version       = BankTools::DK::VERSION
  spec.authors       = [ "Kim Persson" ]
  spec.email         = [ "kim@auctionet.com" ]

  spec.summary       = %q{Validate and normalise Danish bank account numbers.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = [ "lib" ]
end
