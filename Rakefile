require "bundler"
Bundler.setup(:default, :development)
require "rspec/core/rake_task"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "fakerama"
    gem.summary = %Q{Create website content using Faker}
    gem.description = %Q{Create website content using Faker. Incudes html content generation and stock files that can be used in your specs and or scripts}
    gem.email = "steve@wearebeef.co.uk"
    gem.homepage = "http://github.com/stengland/fakerama"
    gem.authors = ["Steve England"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency 'faker'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "fakerama #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
