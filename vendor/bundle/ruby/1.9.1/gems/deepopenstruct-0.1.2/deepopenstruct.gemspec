# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{deepopenstruct}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Gough"]
  s.date = %q{2010-08-23}
  s.description = %q{DeepOpenStruct is a simple library for creating easy-to-use data structures from complex sets of nested Hashes and Arrays. It is particularly suitable for creating easy-to-use data structures from YAML files, and as such is a useful tool for creating simple reflective API wrappers.}
  s.email = %q{aaron@aarongough.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "deepopenstruct.gemspec",
     "lib/deepopenstruct.rb",
     "test/setup/test_unit_extensions.rb",
     "test/test_helper.rb",
     "test/unit/deepopenstruct_test.rb"
  ]
  s.homepage = %q{http://github.com/aarongough/deepopenstruct}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A simple library for creating easy-to-use data structures from complex sets of nested Hashes and Arrays}
  s.test_files = [
    "test/setup/test_unit_extensions.rb",
     "test/test_helper.rb",
     "test/unit/deepopenstruct_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
