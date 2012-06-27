require 'minitest/autorun'
require 'minitest/pride'
require 'bernoulli/distribution'

class PoissonTest < MiniTest::Unit::TestCase

  def setup
    @x = Bernoulli::Distribution::Poisson.new(1)
  end

  def test_to_s
    assert_equal "#<Distribution::Poisson @l=1.0>", @x .to_s
  end
  
  def test_probabilities
    p = [
      0.36787944117144233,
      0.36787944117144233,
      0.18393972058572117,
      0.061313240195240384,
      0.015328310048810096,
      0.0030656620097620196,
      0.0005109436682936699
    ]
    (0..6).each { |v| assert_in_delta p[v], @x[v], 1.0e-7 }
    
    assert_in_delta 1, @x[0..10], 1.0e-7
    assert_in_delta 0.9810118431238463, @x[0..3], 1.0e-7
  end

  def test_expected_value
    assert_equal 1, @x.expected_value
  end

  def test_variance
    assert_equal 1, @x.variance
  end

  def test_standard_deviation
    assert_equal 1, @x.standard_deviation
  end

end

