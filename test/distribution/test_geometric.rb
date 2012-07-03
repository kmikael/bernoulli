require File.expand_path('../../helper', __FILE__)

class GeometricTest < MiniTest::Unit::TestCase

  def setup
    @x = Bernoulli::Distribution::Geometric.new(0.5)
    @y = Bernoulli::Distribution::Geometric.new(0.87)
  end

  def test_to_s
    assert_equal "#<Distribution::Geometric @p=0.5>", @x.to_s
  end

  def test_probabilities
    assert_in_eps 1.0, @x[1..100]
    assert_in_eps 0.5, @x[1]
    assert_in_eps 0.25, @x[2]
  end

  def test_expected_value
    assert_in_eps 2, @x.expected_value
    assert_in_eps 1.149425287, @y.expected_value
  end

  def test_variance
    assert_in_eps 2, @x.variance
    assert_in_eps 0.171753204, @y.variance
  end

  def test_standard_deviation
    assert_in_eps 1.4142135623730951, @x.standard_deviation
    assert_in_eps 0.414431181, @y.standard_deviation
  end
  
  def test_skewness
    assert_in_eps 3.134056109, @y.skewness
  end
  
  def test_excess
    assert_in_eps 11.822307692, @y.excess
  end

end
