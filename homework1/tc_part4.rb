require_relative "part4"
require "minitest/unit"

class TestPart4 < MiniTest::Unit::TestCase

  def setup
    @yoghurt = Dessert.new("Yoghurt", 199)
    @cookies = Dessert.new("Cookies", 200)
    @good_jb = JellyBean.new("Raspberry", 100, "Raspberry")
    @bad_jb = JellyBean.new("Black Licorice", 100, "black licorice")
  end

  def test_getters
    assert_equal "Yoghurt", @yoghurt.name
    assert_equal 199, @yoghurt.calories
  end
  
  def test_setters
    @yoghurt.name = "Strawberries"
    @yoghurt.calories = 75
    
    assert_equal "Strawberries", @yoghurt.name
    assert_equal 75, @yoghurt.calories
  end
  
  def test_healthy
    assert @yoghurt.healthy?
  end
  
  def test_unhealthy
    refute @cookies.healthy?
  end
  
  def test_delicous
    assert @yoghurt.delicious?
    assert @cookies.delicious?
  end
  
  def test_jellybean_not_delicious
    refute @bad_jb.delicious?
  end
  
  def test_jellybean_delicious
    assert @good_jb.delicious?
  end
  
  def test_jellybean_accessor
    assert_equal "Raspberry", @good_jb.flavor

    @good_jb.flavor = "vanilla"
    assert_equal "vanilla", @good_jb.flavor
  end

end
