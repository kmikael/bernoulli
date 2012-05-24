
require 'test/unit'
require 'bernoulli'

class BernoulliTest < Test::Unit::TestCase
	
	def test_factorial
		assert_equal 1, Math.factorial(0)
		assert_equal 1, Math.factorial(1)
		assert_equal 120, Math.factorial(5)
		assert_equal 263130836933693530167218012160000000, Math.factorial(32)
	end

	def test_binomial
		assert_equal 1, Math.binomial(0, 0)
		(1..10).each do |k|
			assert_equal 1, Math.binomial(k, 0)
			assert_equal 1, Math.binomial(k, k)
			assert_equal k, Math.binomial(k, 1)
			assert_equal k, Math.binomial(k, k - 1)
		end
		assert_equal 100947, Math.binomial(23, 17)
	end

	def test_coin_toss
		p = Bernoulli.new(2, 0.5)
		assert_equal 0.5, p[1]
		assert_equal 0.25, p[2]
		assert_equal 1.0, p[0..2]
	end
	
end

