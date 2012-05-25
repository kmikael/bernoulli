
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
	
	def test_new_experiment
		assert_raises RuntimeError do
			Bernoulli.new(10, 1.1)
		end
		assert_raises RuntimeError do
			Bernoulli.new(-10, 0.7)
		end
		assert_raises RuntimeError do
			Bernoulli.new(4.5, 0.2)
		end
	end
	
	def setup
		@x = Bernoulli.new(180, 1.0/6)
		@y = Bernoulli.new(2, 0.5)
	end

	def test_coin_toss
		assert_equal 0.5, @y[1]
		assert_equal 0.25, @y[2]
		assert_equal 1.0, @y[0..2]
	end
	
	def test_expected_value
		assert_equal 30, @x.expected_value
	end
	
	def test_variance
		assert_equal 25, @x.variance
	end
	
	def test_standard_deviation
		assert_equal 5, @x.standard_deviation
	end
	
	def test_skewness
		assert_in_delta 0.1333333333333333, @x.skewness, 1.0e-7
	end
	
	def test_excess
		assert_in_delta 0.0066666666666667, @x.excess, 1.0e-7
	end
	
end

