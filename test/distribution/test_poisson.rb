require File.expand_path('../../helper', __FILE__)

class PoissonTest < MiniTest::Unit::TestCase

  def setup
    @x = Bernoulli::Distribution::Poisson.new(1)
    @y = Bernoulli::Distribution::Poisson.new(112)
    @z = Bernoulli::Distribution::Poisson.new(54)
  end

  def test_to_s
    assert_equal "#<Distribution::Poisson @l=1.0>", @x.to_s
  end
  
  def test_probabilities_1
    p = [
      0.36787944117144233,
      0.36787944117144233,
      0.18393972058572117,
      0.061313240195240384,
      0.015328310048810096,
      0.0030656620097620196,
      0.0005109436682936699
    ]
    (0..6).each { |v| assert_in_eps p[v], @x[v] }
    assert_in_eps 1, @x[0..10]
    assert_in_eps 0.9810118431238463, @x[0..3]
  end
  
  def test_probabilities_2
    assert_in_eps 0.003324518575716, @y[89]
    assert_in_eps 0.0143492278868432, @y[0..89]
  end
  
  def test_probabilities_3
    assert_in_eps 0.0483850390510616, @z[50]
    assert_in_eps 0.32326350500948, @z[0..50]
    assert_in_eps 1.0, @z[0..100]
  end

  def test_expected_value
    assert_equal 1, @x.expected_value
    assert_equal 112, @y.expected_value
  end

  def test_variance
    assert_equal 1, @x.variance
    assert_equal 112, @y.variance
  end

  def test_standard_deviation
    assert_in_eps 1, @x.standard_deviation
    assert_in_eps Math.sqrt(112), @y.standard_deviation
  end
  
  def test_skewness
    assert_in_eps 0.094491118, @y.skewness
  end
  
  def test_excess
    assert_in_eps 0.008928571, @y.excess
  end

end
