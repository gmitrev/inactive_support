# encoding: utf-8
require 'bundler/gem_tasks'
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color']
end

task default: :spec
task test: :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'inactive_support'
  ARGV.clear
  IRB.start
end
