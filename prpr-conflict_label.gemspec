# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prpr/conflict_label/version'

Gem::Specification.new do |spec|
  spec.name          = "prpr-conflict_label"
  spec.version       = Prpr::ConflictLabel::VERSION
  spec.authors       = ["mzp"]
  spec.email         = ["mzpppp@gmail.com"]

  spec.summary       = "Prpr plugin to label unmergeable pull request as conflict."
  spec.description   = "When some commits is pushed, add 'conflict' label to unmergeable pull request."
  spec.homepage      = "https://github.com/mzp/prpr-conflict_label"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "prpr"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
