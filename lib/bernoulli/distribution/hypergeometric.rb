require 'bernoulli/math'

module Bernoulli

  module Distribution
    
    # Implements hypergeometrically distributed random variable
    # See http://en.wikipedia.org/wiki/Hypergeometric_distribution
    # for more information
    class Hypergeometric

      include Distribution
      
      # @param bn [Integer] the size of the population (big n) (> 0)
      # @param m [Integer] the number of successes (>= 0, <= bn)
      # @param n [Integer] the number of draws (>= 1, <= bn)
      def initialize(bn, m, n)
        if bn < 1 or m < 0 or m > bn or n < 1 or n > bn
          raise 'Expecting bn > 1, 0 < m < bn, 0 < n < bn'
        end
        @bn, @m, @n = bn.to_i, m.to_i, n.to_i
      end

      def to_s
        "#<Distribution::Hypergeometric @bn=#@bn, @m=#@m, @n=#@n>"
      end
      
      # @param k [Integer] number of successes (>= 0)
      # @return [Float] the probability of `k` successes
      def probability(k)
        (Math.binomial(@m, k) * Math.binomial(@bn - @m, @n - k)).to_f / Math.binomial(@bn, @n)
      end

      def expected_value
        @n * (@m.to_f / @bn)
      end
      alias :ev :expected_value

      def variance
        (@n * @m * (@bn - @m) *(@bn - @n)).to_f / (@bn * @bn * (@bn - 1))
      end
      alias :v :variance

      def skewness
        ((@bn - 2 * @m) * Math.sqrt(@bn - 1) * (@bn - 2 * @n)) / (Math.sqrt(@n * @m * (@bn - @m) * (@bn - @n)) * (@bn - 2))
      end
  
      def excess
        ((@bn - 1) * @bn * @bn * (@bn * (@bn + 1) - 6 * @m * (@bn - @m) - 6 * @n * (@bn - @n)) + 6 * @n * @m * (@bn - @m) * (@bn - @n) * (5 * @bn - 6)).to_f / (@n * @m * (@bn - @m) * (@bn - @n) * (@bn - 2) * (@bn - 3))
      end

    end

  end
end
