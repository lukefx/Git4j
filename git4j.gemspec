# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "git4j/version"

Gem::Specification.new do |s|
  s.name        = "git4j"
  s.version     = Git4j::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luca Simone"]
  s.email       = ["info@lucasimone.info"]
  s.homepage    = "https://github.com/lukefx"
  s.summary     = "Similar to Grit...but in Java with JGit"
  s.description = "Similar to Grit...but in Java with JGit"

  s.rubyforge_project = "git4j"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
