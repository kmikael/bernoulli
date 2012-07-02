require File.expand_path('../../helper', __FILE__)

class BinomialTest < MiniTest::Unit::TestCase

  def test_new_experiment
    assert_raises RuntimeError do
      Bernoulli::Distribution::Binomial.new(10, 1.1)
    end
    assert_raises RuntimeError do
      Bernoulli::Distribution::Binomial.new(-10, 0.7)
    end
  end

  def setup
    @x = Bernoulli::Distribution::Binomial.new(180, 1.0/6)
    @y = Bernoulli::Distribution::Binomial.new(2, 0.5)
  end

  def test_to_s
    assert_equal "#<Distribution::Binomial @n=2, @p=0.5>", @y.to_s
  end

  def test_coin_toss
    assert_equal 0.25, @y[0]
    assert_equal 0.5, @y[1]
    assert_equal 0.25, @y[2]
    assert_equal 0.75, @y[0..1]
    assert_equal 0.75, @y[1..2]
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
    assert_in_eps 0.1333333333333333, @x.skewness
  end

  def test_excess
    assert_in_eps 0.0066666666666667, @x.excess
  end

end
