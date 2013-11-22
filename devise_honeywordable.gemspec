# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise_honeywordable/version"

Gem::Specification.new do |s|
  s.name        = "devise_honeywordable"
  s.version     = DeviseHoneywordable::VERSION.dup
  s.authors     = ["Chris Wacek"]
  s.email       = ["cwacek@gmail.com"]
  s.homepage    = "https://github.com/cwacek/devise_honeywordable"
  s.summary     = %q{Honeyword authentication plugin for devise}
  s.description = <<-EOF
This plugin adds support for using Honeywords in the
[Devise](http://github.com/plataformatec/devise)
authentication framework. Honeywords were proposed in 2013 as a
method for detecting when password database breaches have
occurred by storing multiple passwords for each user - one
correct one, and a number of honeypot passwords.

An attacker who obtains a database full of hashed passwords and
cracks it will probabilistically have to choose a password for
each user. Each time a 'honeyword' is used it represents evidence
  EOF

  s.rubyforge_project = "devise_honeywordable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rails', '>= 3.2'
  s.add_runtime_dependency 'devise'

  s.add_development_dependency 'bundler'
end

