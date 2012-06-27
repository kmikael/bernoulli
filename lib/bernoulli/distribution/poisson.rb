require 'bernoulli/distribution'
require 'bernoulli/math'

module Bernoulli
  
  module Distribution
    
    class Poisson
      
      include Distribution
      
      def initialize(l)
        @l = l.to_f
      end
      
      def to_s
        "#<Distribution::Poisson @l=#@l>"
      end
      
      def probability(k)
        (@l**k / Math.factorial(k).to_f) * Math.exp(-@l)
      end
      
      def expected_value
        @l
      end
      alias :ev :expected_value
      
      def variance
        @l
      end
      alias :v :variance
      
      def standard_deviation
        Math.sqrt(variance)
      end
      alias :sd :standard_deviation
      
    end
    
  end
end

