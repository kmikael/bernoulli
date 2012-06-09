require File.expand_path('../lib/bernoulli/version', __FILE__)

Gem::Specification.new do |spec|
  
  spec.name = 'bernoulli'
  spec.version = Bernoulli::VERSION
  spec.summary = 'Binomial experiments library'
  spec.description = 'A library that allows calculation of probibilities and properties of binomial experiments like coin tossing'
  spec.homepage = 'http://mkonutgan.github.com/bernoulli'
  
  spec.author = 'Mikael Konutgan'
  spec.email = 'mkonutgan@shortmail.com'
  
  spec.required_ruby_version = '>= 1.8.7'
  spec.required_rubygems_version = '>= 1.3.6'
  
  spec.files = `git ls-files`.split($\)
  spec.test_files = spec.files.grep(/test/)
  
  spec.add_development_dependency 'minitest', '~> 3.0.1'
  spec.add_development_dependency 'rake', '~> 0.9.2.2'
  spec.add_development_dependency 'bundler', '~> 1.1.4'
      
end

