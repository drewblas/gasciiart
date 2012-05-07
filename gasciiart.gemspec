# -*- encoding: utf-8 -*-
require File.expand_path("../lib/gasciiart/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "gasciiart"
  s.version     = Gasciiart::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Drew Blas"]
  s.email       = ["drew.blas@gmail.com"]
  s.homepage    = "http://github.com/drewblas/gasciiart"
  s.summary     = "A generator for git-based asciiart animations"
  s.description = "Use this gem to create a git repo that can play it's file frames as a git animation"

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  # s.rubyforge_project         = "newgem"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"
  s.add_development_dependency 'rspec', '2.10.0'

  # If you need to check in files that aren't .rb files, add them here
  s.require_paths = ["lib"]
  s.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE.txt", "*.md"]
  s.test_files    = Dir["{test,spec}/**/*.rb"]

  # If you need an executable, add it here
  s.executables = ["gasciiart"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
