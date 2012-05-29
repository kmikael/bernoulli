# Bernoulli : A Ruby library for the binomial distribution

In probability theory and statistics, the **binomial distribution** is the discrete probability distribution of the number of successes in a sequence of *n* independent yes/no experiments, each of which yields success with probability *p*.

You can read more about **Bernoulli trials** and the **binomial distribution** [on Wikipedia](http://en.wikipedia.org/wiki/Binomial_distribution).

## Installation

Use RubyGems to install `bernoulli`

	$ gem install bernoulli

## Tutorial

Using `bernoulli`, one can calculate the probabilities of bernoulli experiments.

Let's start by looking at an example.

**Question:** What is the chance of getting between 25 and 36 sixes when one rolls a die 180 times? What is the expected value and variance of this trial?

Let's use `bernoulli` to solve this:

First we load up `irb` from the terminal including `bernoulli` as a library.

	$ irb -r bernoulli
	
Or we could just `require 'bernoulli'` in any Ruby script.

Then we create a new instance of class Bernoulli and calculate our desired probability and properties like so

	x = Bernoulli.new(180, 1.0/6)
	# => #<Bernoulli:0x007fba721a1bf0 @n=180, @p=0.16666666666666666>
	
	# The probability of getting between 25 and 36 sixes is
	x[25..36] # => 0.7665588897840108
	
	x.expected_value # => 30.0
	x.variance # => 25.0
	
We could also calculate the standard deviation, excess or skewness:
	
	x.standard_deviation # => 5.0
	x.excess # => 0.006666666666666665
	x.skewness # => 0.13333333333333336
	
`bernoulli` can also do empirical tests. Let's look at a smaller example We can simulate the tossing of 4 fair coins

	y = Bernoulli.new(4, 0.5)
	# => #<Bernoulli:0x007ff894293198 @n=4, @p=0.5>

The method `sample` gives as a random array of length `n`, where each entry is `1` with a probability of `p`. The methods `sample_value` gives us the number of wins in a random expriment, we could than compare it to `expected_value`.

	y.sample # => [1, 0, 1, 0]
	y.sample # => [0, 0, 1, 0]
	y.sample # => [1, 1, 1, 1]

	y.sample_value # => 2
	y.sample_value # => 1
	y.sample_value # => 0
	y.sample_value # => 2
	
	y.expected_value # => 2.0

Last, but not least, we can create a full table of all possible values and their probabilitys like so

	puts y.table
	
will produce

	0,0.0625
	1,0.25
	2,0.375
	3,0.25
	4,0.0625

## Contributing

`bernoulli` is a really small project. After writing the same code for some project and then losing it two or three times I decided to do it one time and well, so I can just call in the code from here next time.

Feel free to cantact me about anything I could/should add  or to contribute in any way to this simple library.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

