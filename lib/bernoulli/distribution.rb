require 'bernoulli/distribution/binomial'

module Bernoulli
  
  module Distribution
    
    def [](k)
      if k.is_a? Integer
        raise Math::DomainError if not (k <= @n and k >= 0)
        probability(k).to_f
      elsif k.is_a? Range
        raise Math::DomainError if not (k.begin >= 0 and k.end <= @n)
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

