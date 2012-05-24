
module Math

	def self.factorial(n)
		if n == 0
			1
		else
			(1..n).inject(:*)
		end
	end

	def self.binomial(n, k)
		factorial(n)/(factorial(k) * factorial(n - k))
	end

end

