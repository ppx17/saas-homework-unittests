require_relative "part5"
require "test/unit"

class SinglePropertyTestClass
  attr_accessor_with_history :bar
end

class MultiPropertyTestClass
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

class TestRpsGame < Test::Unit::TestCase
  
  def test_single_property_history
    f = SinglePropertyTestClass.new
    
    f.bar = 3
    f.bar = :wowzo
    f.bar = 'boo!'
    
    assert_equal [nil, 3, :wowzo, 'boo!'], f.bar_history
  end
  
    
  def test_multi_property_history
    f = MultiPropertyTestClass.new
    
    f.foo = :wowzo
    f.foo = "blah"
    f.foo = 300
    
    f.bar = 3
    f.bar = :wowzo
    f.bar = 'boo!'
    
    assert_equal [nil, :wowzo, "blah", 300], f.foo_history
    assert_equal [nil, 3, :wowzo, 'boo!'], f.bar_history
  end
  
  ##
  ##  To make comparing a bit more readable, all results are rounded with 2 decimal precision
  ##
  
  def test_basic_conversions
    assert_equal 1.292, 1.euro
    assert_equal 0.019, 1.rupee
    assert_equal 0.013, 1.yen
    assert_equal 1, 1.dollar
  end
  
  def test_conversions_to_dollar
    assert_equal 1, 1.dollar.in(:dollars).round(2)
    assert_equal 1, 1.dollar.in(:dollar).round(2)
    
    assert_equal 1.90, 100.rupee.in(:dollars).round(2)
    assert_equal 1.90, 100.rupee.in(:dollar).round(2)
    
    assert_equal 1.30, 100.yen.in(:dollars).round(2)
    assert_equal 1.30, 100.yen.in(:dollar).round(2)
    
    assert_equal 1.29, 1.euro.in(:dollars).round(2)
    assert_equal 1.29, 1.euro.in(:dollar).round(2)
  end
  
  def test_conversions_to_euro
    assert_equal 0.77, 1.dollar.in(:euros).round(2)
    assert_equal 0.77, 1.dollar.in(:euro).round(2)
    
    assert_equal 1.47, 100.rupee.in(:euros).round(2)
    assert_equal 1.47, 100.rupee.in(:euro).round(2)
    
    assert_equal 1.01, 100.yen.in(:euros).round(2)
    assert_equal 1.01, 100.yen.in(:euro).round(2)
    
    assert_equal 1, 1.euro.in(:euros).round(2)
    assert_equal 1, 1.euro.in(:euro).round(2)
  end
  
  def test_conversions_to_rupee
    assert_equal 52.63, 1.dollar.in(:rupees).round(2)
    assert_equal 52.63, 1.dollar.in(:rupee).round(2)
    
    assert_equal 100, 100.rupee.in(:rupees).round(2)
    assert_equal 100, 100.rupee.in(:rupee).round(2)
    
    assert_equal 68.42, 100.yen.in(:rupees).round(2)
    assert_equal 68.42, 100.yen.in(:rupee).round(2)
    
    assert_equal 68, 1.euro.in(:rupees).round(2)
    assert_equal 68, 1.euro.in(:rupee).round(2)
  end
  
  def test_conversions_to_yen
    assert_equal 76.92, 1.dollar.in(:yens).round(2)
    assert_equal 76.92, 1.dollar.in(:yen).round(2)
    
    assert_equal 146.15, 100.rupee.in(:yens).round(2)
    assert_equal 146.15, 100.rupee.in(:yen).round(2)
    
    assert_equal 100, 100.yen.in(:yens).round(2)
    assert_equal 100, 100.yen.in(:yen).round(2)
    
    assert_equal 99.38, 1.euro.in(:yens).round(2)
    assert_equal 99.38, 1.euro.in(:yen).round(2)
  end
  
  def test_palindrome
    assert_equal true, "A man, a plan, a canal -- Panama".palindrome? 
    assert_equal true, "Madam, I'm Adam!".palindrome?
    assert_equal false, "Madam, I'm Adam! Yes".palindrome?
    assert_equal false, "Abracadabra".palindrome?
  end
  
  def test_hash_palindrome_int
    #Test ints true
    assert_equal true, [1,2,3,2,1].palindrome?
    #Test ints false
    assert_equal false, [1,2,3,2,2].palindrome?
  end
  
  def test_hash_palindrome_mixed
    #Test mixed true
    assert_equal true, [:one, 2, "Blah", 2, :one].palindrome?
    #Test mixed false
    assert_equal false, [:two, 2, "Blah", 2, :one].palindrome?
  end
  
  def test_hash_palindrome_cases
    #Test cases true
    assert_equal true, ["stringtest", 2, "Blah", 2, "StringTest"].palindrome?
  end
  
  def test_hash_palindrome_even_element_count
    #Test even elements
    assert_equal true, ["stringtest", 2, "Blah", "Blah", 2, "stringtest"].palindrome?
  end
  
end