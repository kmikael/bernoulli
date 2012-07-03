require 'bernoulli/distribution/binomial'
require 'bernoulli/distribution/hypergeometric'
require 'bernoulli/distribution/geometric'
require 'bernoulli/distribution/poisson'

module Bernoulli
  
  # Top level Module for all the probability distributions
  # Also provides convinience methods and `#standard_deviation`, which
  # is calculated the same way independent of the distribution
  module Distribution
    
    # Calculate the sum of the probabilities across a range
    # @param r [Range]
    def probability_range(r)
      r.inject(0) { |s, k| s + probability(k) }
    end
    
    # A shortcut to the `#probability` and `#probability_range`
    # methods
    # @param k [Integer, Range]
    def [](k)
      if k.is_a? Integer
        probability(k).to_f
      elsif k.is_a? Range
        probability_range(k).to_f
      else
        raise TypeError, 'Expecting Integer or Range - "[]"'
      end
    end
    
    # The standard deviation of a random variable
    # is the square root of its variance.
    def standard_deviation
      Math.sqrt(variance)
    end
    alias :sd :standard_deviation
    
  end
end
