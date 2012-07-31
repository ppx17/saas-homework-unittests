require_relative "part1"
require "minitest/unit"

class TestPart1 < MiniTest::Unit::TestCase
  
  def test_palindrome_valid
    assert palindrome?("A man, a plan, a canal -- Panama") 
    assert palindrome?("Madam, I'm Adam!")
    refute palindrome?("Madam, I'm Adam! Yes")
    refute palindrome?("Abracadabra")
  end
  
  def test_count_words_valid 
    assert_equal({'a'=>3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}, count_words("A man, a plan, a canal -- Panama"))
    assert_equal({'doo' => 3, 'bee' => 2}, count_words("Doo bee doo bee doo"))
  end
end
