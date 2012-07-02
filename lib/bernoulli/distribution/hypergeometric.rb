require 'bernoulli/distribution'
require 'bernoulli/math'

module Bernoulli

  module Distribution

    class Hypergeometric

      include Distribution

      def initialize(bn, m, n)
        if bn < 1 or m < 0 or m > bn or n < 1 or n > bn
          raise 'Expecting bn > 1, 0 < m < bn, 0 < n < bn'
        end
        @bn, @m, @n = bn.to_i, m.to_i, n.to_i
      end

      def to_s
        "#<Distribution::Hypergeometric @bn=#@bn, @m=#@m, @n=#@n>"
      end

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
        ((@bn - 2 * @m) * Math.sqrt(@bn - 1) * (@bn - 2 * n)) / (Math.sqrt(@n * @m * (@bn - @m) * (@bn - n)) * (@bn - 2))
      end
  
      def excess
      end

    end

  end
end

