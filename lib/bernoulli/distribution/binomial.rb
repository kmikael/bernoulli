require 'bernoulli/math'

module Bernoulli
  
  module Distribution
    
    # Implements binomially distributed random variable
    # See http://en.wikipedia.org/wiki/Binomial_distribution
    # for more information
    class Binomial
      
      include Distribution
      
      # @param n [Integer] the number of trials (>= 0)
      # @param p [Float] success probability in each trial
      def initialize(n, p)
        if n < 0 or p > 1.0 or p < 0.0
          raise 'Expecting n >= 0 and 0.0 <= p <= 1.0'
        end
        @n = n.to_i
        @p = p.to_f
      end
      
      def to_s
        "#<Distribution::Binomial @n=#@n, @p=#@p>"
      end
      
      # @param k [Integer] the number of successes (>= 0)
      # @return [Float] the probability of `k` successes
      def probability(k)
        Math.binomial(@n, k) * @p**k * (1 - @p)**(@n - k)
      end
      
      # Preform a binomial experiment of length `@n` and probability `@p`
      # @return [Array<0, 1>] the resulting random array
      def sample
        s = []
        @n.times do
          s << (rand < @p ? 1 : 0)
        end
        s
      end
      
      # @return [Integer] number of 1's in a run of `#sample`
      def sample_value
        sample.count(1)
      end
      alias :sv :sample_value
      
      def expected_value
        @n * @p
      end
      alias :ev :expected_value
      
      def variance
        @n * @p * (1 - @p)
      end
      alias :v :variance
      
      def skewness
        (1 - 2 * @p) / (Math.sqrt(@n * @p * (1 - @p)))
      end
      
      def excess
        (1 - 6 * @p * (1 - @p)) / (@n * @p * (1 - @p))
      end
      
    end
    
  end
end
