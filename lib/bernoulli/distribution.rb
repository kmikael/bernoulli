require 'bernoulli/distribution/binomial'
require 'bernoulli/distribution/poisson'

module Bernoulli
  
  module Distribution
    
    def [](k)
      if k.is_a? Integer
        probability(k).to_f
      elsif k.is_a? Range
        sum = 0
        k.each do |i|
          sum += probability(i)
        end
        sum.to_f
      else
        raise TypeError, 'Expecting Integer or Range - "[]"'
      end
    end
    
  end
end

