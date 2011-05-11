# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "futures_pipeline/version"

Gem::Specification.new do |s|
  s.name        = "futures_pipeline"
  s.version     = FuturesPipeline::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Erik Michaels-Ober", "Ryan Resella"]
  s.email       = ["erik@codeforamerica.org", "ryan@codeforamerica.org"]
  s.homepage    = ""
  s.summary     = "Ruby wrapper for the Futures, Inc. US Military Pipeline API"
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('ZenTest', '~> 4.5')
  s.add_development_dependency('maruku', '~> 0.6')
  s.add_development_dependency('rake', '~> 0.8')
  s.add_development_dependency('rspec', '~> 2.5')
  s.add_development_dependency('simplecov', '~> 0.4')
  s.add_development_dependency('yard', '~> 0.6')
end
