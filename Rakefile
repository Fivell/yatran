#!/usr/bin/env rake
require 'bundler'
require "bundler/gem_tasks"
Bundler::GemHelper.install_tasks


require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task
task :default => :spec