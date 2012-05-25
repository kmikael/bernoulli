
require 'bernoulli/math'

class Bernoulli

	def initialize(n, p)
		if n < 0 or p > 1.0 or p < 0.0 or not n.is_a? Integer
			raise 'Could not initialize Bernoulli experiment'
		end
		@n = n
		@p = p
	end

	def probability(k)
		Math.binomial(@n, k) * @p**k * (1 - @p)**(@n - k)
	end

	def [](k)
		if k.is_a? Integer
			raise Math::DomainError if not (k <= @n and k >= 0)
			self.probability(k).to_f
		elsif k.is_a? Range
			raise Math::DomainError if not (k.begin >= 0 and k.end <= @n)
			sum = 0
			k.each do |i|
				sum += self.probability(i)
			end
			sum.to_f
		else
			raise TypeError
		end
	end
	
	def expected_value
		@n * @p
	end
	alias :ev :expected_value
	
	def variance
		@n * @p * (1 - @p)
	end
	alias :v :variance
	
	def standard_deviation
		Math.sqrt(self.variance)
	end
	alias :sd :standard_deviation
	
	def skewness
		(1 - 2 * @p) / (Math.sqrt(@n * @p * (1 - @p)))
	end
	
	def excess
		(1 - 6 * @p * (1 - @p)) / (@n * @p * (1 - @p))
	end

end

