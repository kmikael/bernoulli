require 'bernoulli/distribution'
require 'bernoulli/math'

module Bernoulli
  
  module Distribution
    
    class Poisson
      
      include Distribution
      
      def initialize(l)
        if l <= 0.0
          raise 'Expecting l > 0.0'
        end
        @l = l.to_f
      end
      
      def to_s
        "#<Distribution::Poisson @l=#@l>"
      end
      
      def probability(k)
        (@l**k / Math.factorial(k)) * Math.exp(-@l)
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
