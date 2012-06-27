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
        raise TypeError
      end
    end
    
    def table
      csv = ""
      (0..@n).each do |n|
        csv << n.to_s << "," << probability(n).to_s << "\n"
      end
      csv
    end
    
  end
end

