require 'rake/testtask'
require 'bundler/gem_tasks'

task :default => :test

Rake::TestTask.new do |test|
end

desc 'Remove pkg directory'
task :clean do
  rm_rf 'pkg/'
end

spec = eval File.read('bernoulli.gemspec')

desc "Remove and uninstall #{spec.name}-#{spec.version}.gem from system gems"
task :uninstall => :clean do
  sh 'gem uninstall bernoulli'
end

