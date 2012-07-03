# Bernoulli: Discrete probability distribution library for Ruby

**Bernoulli** implements the four most common discrete probability distributions in an object oriented manner and in pure Ruby.

- The binomial distribution
- The geometric distribution
- The hypergeometric distribution
- The Poisson distribution

## Installation

Use RubyGems to install `bernoulli`

	$ gem install bernoulli

## Tutorial

The classes in `bernoulli` reprsent random variables:

    Bernoulli::Distribution::<DistributionName>
    
If, for example you wanted to have a geometrically distributed random variable with parameter 0.43, you would do:

    y = Bernoulli::Distribution::Geometric.new(0.43)
    
Also if you `require 'bernoulli/shorthand'` too, you will get top level shortcut functions to create new instances of all distributions:

- `binomdist`
- `geomdist`
- `hgeomdist`
- `poissondist`

So `y = geomdist(0.43)` would be equivalent to the code shown above.
    
After this you call methods on `y`. The methods avalible to all distributions are:

- `probability`
- `probability_range`
- `expected_value`
- `variance`
- `standard_deviation`
- `skewness`
- `excess`

Again, shortcuts include (but this time included automatically):

- `ev` for `expected_value`
- `v` for `variance`
- `sd` for `standard_deviation`
- `[]`, which takes a number or a range and then executes `probability` or `probability_range`

### Example

    require 'bernoulli'
    require 'bernoulli/shorthand'
    
    x = binomdist(180, 1.0/6)
    # => #<Distribution::Binomial @n=180, @p=0.16666666666666666>
    
    x.ev # => 30.0
    x.v # => 25.0
    x[25..36] # => 0.7665588897840108
    
Last, but not least, there are two methods exclusive to the binomial distribution:

The method `sample` returns a random array of length `n`, where each entry is 1 with a probability of `p`. This is esentially modelling a binomial experiment.

The method `sample_value` returns the number of successes in a random binomial expriment that was executed using `sample`. `sv` is a shortcut for `sample_value`.

## Contributing

`bernoulli` is a small project. After writing the same code for some project and then losing it two or three times I decided to do it one time and well, so I can just call in the code from here next time.

Feel free to cantact me about anything I could/should add or to contribute in any way to this simple library.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
