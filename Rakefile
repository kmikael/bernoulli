require 'rake/testtask'

desc 'Run tests'
Rake::TestTask.new do |test|
end

task :default => :test

desc 'Build gem'
task :gem do
	sh 'gem build bernoulli.gemspec'
end

