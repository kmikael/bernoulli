require 'minitest/autorun'
require 'minitest/pride'
require 'bernoulli/distribution'

class HypergeometricTest < MiniTest::Unit::TestCase

  def setup
    @x = Bernoulli::Distribution::Hypergeometric.new(5, 3, 2)
  end

  def test_to_s
    assert_equal "#<Distribution::Hypergeometric @bn=5, @m=3, @n=2>", @x.to_s
  end

  def test_probabilities
    assert_in_delta 1.0/10, @x[0], 1.0e-7
    assert_in_delta 6.0/10, @x[1], 1.0e-7
    assert_in_delta 3.0/10, @x[2], 1.0e-7
    assert_in_delta 1.0, @x[0..2], 1.0e-7
    assert_in_delta 9.0/10, @x[1..2], 1.0e-7
    
    assert_in_delta 0, @x[3], 1.0e-7
    assert_in_delta 0, @x[4], 1.0e-7
  end

  def test_expected_value
  end

  def test_variance
  end

  def test_standard_deviation
  end

end

