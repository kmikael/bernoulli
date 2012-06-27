require 'minitest/autorun'
require 'minitest/pride'
require 'bernoulli/math'

class MathTest < MiniTest::Unit::TestCase
  
  def test_factorial
    assert_raises(Math::DomainError) { Math.factorial(-1) }
    assert_equal 1, Math.factorial(0)
    assert_equal 1, Math.factorial(1)
    assert_equal 2, Math.factorial(2)
    assert_equal 120, Math.factorial(5)
    assert_equal 263130836933693530167218012160000000, Math.factorial(32)
  end
  
  def test_binomial
    pairs = [[-1, 0], [2, 4], [-2, -1], [6, -3], [12, 50]]
    pairs.each do |pair|
      assert_equal 0, Math.binomial(*pair)
    end
    assert_equal 1, Math.binomial(0, 0)
    (1..20).each do |k|
      assert_equal 1, Math.binomial(k, 0)
      assert_equal 1, Math.binomial(k, k)
      assert_equal k, Math.binomial(k, 1)
      assert_equal k, Math.binomial(k, k - 1)
    end
    (15..20).each do |n|
      (5..15).each do |k|
        assert_equal Math.binomial(n, k), Math.binomial(n, n - k)
      end
    end
    assert_equal 100947, Math.binomial(23, 17)
  end
  
end

