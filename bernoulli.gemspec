
Gem::Specification.new do |spec|
	
	spec.name = 'bernoulli'
	spec.version = '0.1.0'
	spec.summary = 'Binomial experiments library'
	spec.description = 'A Library that allows calculation of probibilities and properties of binomial experiments'
	spec.homepage = 'https://github.com/mkonutgan/bernoulli'
	
	spec.date = '2012-05-25'
	
	spec.author = 'Mikael Konutgan'
	spec.email = 'mkonutgan@shortmail.com'
	
	spec.required_ruby_version = '>= 1.9.2'
	
	spec.files = [
		'README.md',
		'Rakefile',
		'bernoulli.gemspec',
		'lib/bernoulli.rb',
		'lib/bernoulli/math.rb',
		'test/test_bernoulli.rb'
	]
	spec.test_files = [
		'test/test_bernoulli.rb'
	]
	
end

