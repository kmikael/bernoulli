require File.expand_path('../../helper', __FILE__)

class HypergeometricTest < MiniTest::Unit::TestCase

  def setup
    @x = Bernoulli::Distribution::Hypergeometric.new(5, 3, 2)
    @y = Bernoulli::Distribution::Hypergeometric.new(50, 17, 9)
  end

  def test_to_s
    assert_equal "#<Distribution::Hypergeometric @bn=5, @m=3, @n=2>", @x.to_s
  end

  def test_probabilities
    assert_in_eps 0.1, @x[0]
    assert_in_eps 0.6, @x[1]
    assert_in_eps 0.3, @x[2]
    assert_in_eps 1.0, @x[0..2]
    assert_in_eps 0.9, @x[1..2]
    assert_in_eps 0.0, @x[3]
    assert_in_eps 0.0, @x[4]
    
    assert_in_eps 1.0, @y[0..9]
    assert_in_eps 0.0, @y[10]
  end

  def test_expected_value
    assert_in_eps 1.2, @x.expected_value
    assert_in_eps 3.06, @y.expected_value
  end

  def test_variance
    assert_in_eps 0.36, @x.variance
    assert_in_eps 1.689869388, @y.variance
  end

  def test_standard_deviation
    assert_in_eps 0.6, @x.standard_deviation
    assert_in_eps 1.299949764, @y.standard_deviation
  end
  
  def test_skewness
    assert_in_eps -0.111111111, @x.skewness
    assert_in_eps 0.164108906, @y.skewness
  end
  
  def test_excess
    assert_in_eps -0.444444444, @x.excess
    assert_in_eps -0.14585017, @y.excess
  end

end
