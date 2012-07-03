require 'bernoulli/math'

module Bernoulli
  
  module Distribution
    
    # Implements Poisson distributed random variable
    # See http://en.wikipedia.org/wiki/Poisson_distribution
    # for more information
    class Poisson
      
      include Distribution
      
      # @param l [Float] the avarage rate of success in a time period
      def initialize(l)
        if l <= 0.0
          raise 'Expecting l > 0.0'
        end
        @l = l.to_f
      end
      
      def to_s
        "#<Distribution::Poisson @l=#@l>"
      end
      
      # @param k [Integer] number of successes (>= 0)
      # @return [Float] the probability of `k` successes
      # in the time period
      def probability(k)
        (@l**k / Math.factorial(k)) * Math.exp(-@l)
      end
      
      def probability_range(r)
        Math.exp(-@l) * r.inject(0) { |s, k| s + (@l**k / Math.factorial(k)) }
      end
      
      def expected_value
        @l
      end
      alias :ev :expected_value
      
      def variance
        @l
      end
      alias :v :variance
      
      def skewness
        1 / Math.sqrt(@l)
      end
      
      def excess
        1 / @l
      end
      
    end
    
  end
end
