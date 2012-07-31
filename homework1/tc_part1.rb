require_relative "part1"
require "minitest/unit"

class TestRpsGame < MiniTest::Unit::TestCase
  
  def test_palindrome_valid
    assert_equal true, palindrome?("A man, a plan, a canal -- Panama") 
    assert_equal true, palindrome?("Madam, I'm Adam!")
    assert_equal false, palindrome?("Madam, I'm Adam! Yes")
    assert_equal false, palindrome?("Abracadabra")
  end
  
  def test_count_words_valid 
    assert_equal({'a'=>3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}, count_words("A man, a plan, a canal -- Panama"))
    assert_equal({'doo' => 3, 'bee' => 2}, count_words("Doo bee doo bee doo"))
  end
end
