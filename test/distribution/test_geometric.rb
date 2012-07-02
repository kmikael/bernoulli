require File.expand_path('../../helper', __FILE__)

class GeometricTest < MiniTest::Unit::TestCase

  def setup
    @x = Bernoulli::Distribution::Geometric.new(0.5)
  end

  def test_to_s
    assert_equal "#<Distribution::Geometric @p=0.5>", @x.to_s
  end

  def test_probabilities
    assert_in_eps 1.0, @x[1..100]
    assert_equal 0.5, @x[1]
    assert_equal 0.25, @x[2]
  end

  def test_expected_value
    assert_equal 2, @x.expected_value
  end

  def test_variance
    assert_equal 2, @x.variance
  end

  def test_standard_deviation
    assert_in_eps 1.4142135623730951, @x.standard_deviation
  end

end
