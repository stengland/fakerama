# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fakerama/version"

Gem::Specification.new do |s|
  s.name        = "fakerama"
  s.version     = Fakerama::VERSION
  s.authors     = ["Steve England"]
  s.email       = ["steve@wearebeef.co.uk"]
  s.homepage = %q{http://github.com/stengland/fakerama}
  s.summary     = %q{Create website content using Faker}
  s.description = %q{Create website content using Faker. Incudes html content generation and stock files that can be used in your specs and or scripts}

  s.rubyforge_project = "fakerama"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("faker", [">= 0"])
  s.add_dependency("actionpack", [">= 0"])
  s.add_dependency("activesupport", [">= 0"])
  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
