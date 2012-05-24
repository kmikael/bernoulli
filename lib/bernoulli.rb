
require 'bernoulli/math'

class Bernoulli

	def initialize(n, p)
		@n = n
		@p = p
	end

	def probability(k)
		Math.binomial(@n, k) * @p**k * (1 - @p)**(@n - k)
	end

	def [](k)
		if k.is_a? Integer
			self.probability(k).to_f
		elsif k.is_a? Range
			sum = 0
			k.each do |i|
				sum += self.probability(i)
			end
			sum.to_f
		end
	end
	
	def expected_value
		@n * @p
	end
	
	def variance
		@n * @p * (1 - @p)
	end

end

