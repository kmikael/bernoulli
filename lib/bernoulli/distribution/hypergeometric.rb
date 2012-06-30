require 'bernoulli/distribution'
require 'bernoulli/math'

module Bernoulli

  module Distribution

    class Hypergeometric

      include Distribution

      def initialize(bn, m, n)
        if bn < 1 or m < 0 or m > bn or n < 1 or n > bn
          raise 'Could not initialize - Expecting N > 1, 0 < m < N or 0 < n < N'
        end
        @bn, @m, @n = bn, m, n
      end

      def to_s
        "#<Distribution::Hypergeometric @bn=#@bn, @m=#@m, @n=#@n>"
      end

      def probability(k)
        (Math.binomial(@m, k) * Math.binomial(@bn - @m, @n - k)).to_f / Math.binomial(@bn, @n)
      end

      def expected_value
        @bn * (@m / @bn)
      end
      alias :ev :expected_value

      def variance
        (@bn * @m * (@bn - @m) *(@bn - @bn)) / (@bn * @bn * (@bn - 1))
      end
      alias :v :variance

      def skewness
        
      end

      def excess
      end

    end

  end
end

