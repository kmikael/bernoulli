require 'bernoulli/math'
require 'bernoulli/distribution'

module Bernoulli
  
  module Distribution
    
    class Binomial
      
      include Distribution
      
      def initialize(n, p)
        if n < 0 or p > 1.0 or p < 0.0
          raise 'Could not initialize - Expecting n < 0 and 0.0 < p < 1.0'
        end
        @n = n.to_i
        @p = p.to_f
      end
      
      def to_s
        "#<Distribution::Binomial @n=#@n, @p=#@p>"
      end
      
      def probability(k)
        Math.binomial(@n, k) * @p**k * (1 - @p)**(@n - k)
      end
      
      def sample
        s = []
        @n.times do
          s << (rand < @p ? 1 : 0)
        end
        s
      end
      
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
      
      def standard_deviation
        Math.sqrt(variance)
      end
      alias :sd :standard_deviation
      
      def skewness
        (1 - 2 * @p) / (Math.sqrt(@n * @p * (1 - @p)))
      end
      
      def excess
        (1 - 6 * @p * (1 - @p)) / (@n * @p * (1 - @p))
      end
      
    end
  end
end

