require 'bernoulli/distribution'

module Bernoulli

  module Distribution

    class Geometric

      include Distribution

      def initialize(p)
        if p > 1.0 or p < 0.0
          raise 'Could not initialize - Expecting 0.0 < p < 1.0'
        end
        @p = p.to_f
      end

      def to_s
        "#<Distribution::Geometric @p=#@p>"
      end

      def probability(k)
        if k == 0
          0
        else
          (1 - @p)**(k - 1) * @p
        end
      end

      def expected_value
        1 / @p
      end
      alias :ev :expected_value

      def variance
        (1 - @p) / @p**2
      end
      alias :v :variance

      def skewness
        (2 - @p) / Math.sqrt(1 - @p)
      end

      def excess
        6 + @p**2 / (1 - @p)
      end

    end

  end
end
