require_relative "part6"
require "minitest/unit"

class TestRpsGame < MiniTest::Unit::TestCase
  def test_cartesian_product_equal_arrays    
    assert_equal [[:a, 4], [:a, 5], [:b, 4], [:b, 5]], get_result_from_inputs([:a, :b], [4, 5])
  end
  
  def test_cartesian_product_one_empty
    assert_equal [], get_result_from_inputs([:a, :b], [])
  end
  
  def test_empty_arrays
    assert_equal [], get_result_from_inputs([], [])
  end
  
  def test_other_2_by_2
    assert_equal [[:a, 8], [:a, 9], [:b, 8], [:b, 9]], get_result_from_inputs([:a, :b], [8, 9])
  end
  
  def test_3_by_3
    assert_equal [[:a, 8], [:a, 9], [:a, 10], 
                  [:b, 8], [:b, 9], [:b, 10], 
                  [:c, 8], [:c, 9], [:c, 10]], get_result_from_inputs([:a, :b, :c], [8, 9, 10])
  end
  
  def test_4_by_4
    assert_equal [[:a, 8], [:a, 9], [:a, 10], [:a, 11], 
                  [:b, 8], [:b, 9], [:b, 10], [:b, 11],  
                  [:c, 8], [:c, 9], [:c, 10], [:c, 11],  
                  [:d, 8], [:d, 9], [:d, 10], [:d, 11]], get_result_from_inputs([:a, :b, :c, :d], [8, 9, 10, 11])
  end
  
  def get_result_from_inputs(left, right)
    c= CartesianProduct.new(left, right)
    result = []
    c.each{ |el| result << el} 
    result
  end
end
