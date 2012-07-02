require 'minitest/unit'
require 'minitest/pride'

require 'bernoulli/distribution'

class MiniTest::Unit::TestCase

  def assert_in_eps exp, act
    assert_in_delta exp, act, 1.0e-7
  end
  
end
