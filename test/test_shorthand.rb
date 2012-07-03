require 'bernoulli/distribution'
require 'bernoulli/shorthand'

class ShorthandTest < MiniTest::Unit::TestCase

  def test_binomdist
    x = Bernoulli::Distribution::Binomial.new(10, 0.71)
    assert_equal x.to_s, binomdist(10, 0.71).to_s
  end
  
  def test_geomdist
    x = Bernoulli::Distribution::Geometric.new(0.53)
    assert_equal x.to_s, geomdist(0.53).to_s
  end
  
  def test_hgeomdist
    x = Bernoulli::Distribution::Hypergeometric.new(20, 14, 5)
    assert_equal x.to_s, hgeomdist(20, 14, 5).to_s
  end
  
  def test_poissondist
    x = Bernoulli::Distribution::Poisson.new(13.3)
    assert_equal x.to_s, poissondist(13.3).to_s
  end
  
end
