require 'bundler/gem_tasks'
require 'rake/testtask'
require 'yard'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/test*.rb'
end

YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb']
  t.options = ['--markup=markdown']
end

desc 'Remove pkg and doc directories'
task :clean do
  rm_rf 'pkg/'
  rm_rf 'doc/'
end

spec = eval File.read('bernoulli.gemspec')

desc "Remove and uninstall #{spec.name}-#{spec.version}.gem from system gems"
task :uninstall => :clean do
  sh 'gem uninstall bernoulli'
end
