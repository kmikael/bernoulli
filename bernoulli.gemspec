require File.expand_path('../lib/bernoulli/version', __FILE__)

Gem::Specification.new do |spec|
  
  spec.name = 'bernoulli'
  spec.version = Bernoulli::VERSION
  spec.summary = 'Discrete probability distribution library for Ruby'
  spec.description = 'Bernoulli implements standard methods used for statistcal calculations with discrete probability distributions in an object oriented manner and in pure Ruby'
  spec.homepage = 'http://mkonutgan.github.com/bernoulli'
  
  spec.author = 'Mikael Konutgan'
  spec.email = 'mkonutgan@gmail.com'
  
  spec.required_ruby_version = '>= 1.8.7'
  spec.required_rubygems_version = '>= 1.3.6'
  
  spec.files = `git ls-files`.split
  spec.test_files = spec.files.grep(/test_/)
  
  spec.add_development_dependency 'minitest', '>= 2.5'
  spec.add_development_dependency 'rake', '>= 0.9'
  spec.add_development_dependency 'bundler', '>= 1.1'
      
end
