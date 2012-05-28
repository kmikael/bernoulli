# Bernoulli : A Ruby library for the binomial distribution

In probability theory and statistics, the **binomial distribution** is the discrete probability distribution of the number of successes in a sequence of *n* independent yes/no experiments, each of which yields success with probability *p*.

You can read more about **Bernoulli trials** and the **binomial distribution** [on Wikipedia](http://en.wikipedia.org/wiki/Binomial_distribution).

## Installation

Use RubyGems to install `bernoulli`

	$ gem install bernoulli

## Uses

Using `bernoulli`, one can calculate the probabilities of bernoulli experiments.

### Example Usage

**Question:** What is the chance of getting between 25 and 36 sixes when one rolls a die 180 times? What is the expected value and variance of this trial?

Let's use `bernoulli` to solve this:

First we load up `irb` from the terminal including `bernoulli` as a library

	$ irb -r bernoulli
	
Or we could just include `require 'bernoulli'` in any Ruby script

Then we create a new instance of class Bernoulli and calculate our desired probability and properties

	x = Bernoulli.new(180, 1.0/6)
	# => #<Bernoulli:0x007fba721a1bf0 @n=180, @p=0.16666666666666666>
	
	# The probability of getting between 25 and 36 sixes is
	x[25..36] # => 0.7665588897840108
	
	x.expected_value # => 30.0
	x.variance # => 25.0

