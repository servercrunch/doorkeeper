#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Doorkeeper'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec)

namespace :doorkeeper do
  desc "Install doorkeeper in dummy app"
  task :install do
    cd 'spec/dummy'
    system 'bundle exec rails g doorkeeper:install --force'
  end

  desc "Update doorkeeper in dummy app"
  task :updated do
    cd 'spec/dummy'
    system 'bundle exec rails g doorkeeper:update --force'
  end
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks
