require 'bernoulli/distribution/binomial'
require 'bernoulli/distribution/hypergeometric'
require 'bernoulli/distribution/geometric'
require 'bernoulli/distribution/poisson'

module Bernoulli
  
  module Distribution
    
    def probability_range(r)
      r.inject(0) { |s, k| s + probability(k) }
    end
    
    def [](k)
      if k.is_a? Integer
        probability(k).to_f
      elsif k.is_a? Range
        probability_range(k).to_f
      else
        raise TypeError, 'Expecting Integer or Range - "[]"'
      end
    end
    
    def standard_deviation
      Math.sqrt(variance)
    end
    alias :sd :standard_deviation
    
  end
end
