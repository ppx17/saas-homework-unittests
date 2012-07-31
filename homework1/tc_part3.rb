require_relative "part3"
require "minitest/unit"

class TestRpsGame < MiniTest::Unit::TestCase
  def test_example_anagram
    input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
    output = [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]]
    
    assert_equal output, combine_anagrams(input)
  end
  
  def test_maintain_case
    input = ['cars', 'RAcs', 'ScaR', 'scReaM', 'CrEamS']
    output = [["cars", "RAcs", "ScaR"], ["scReaM", "CrEamS"]]
    
    assert_equal output, combine_anagrams(input)
  end
end
