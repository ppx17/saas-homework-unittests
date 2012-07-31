require_relative "part4"
require "minitest/unit"

class TestRpsGame < MiniTest::Unit::TestCase
  def test_getters
    dessert = Dessert.new("Yoghurt", 100)
    
    assert_equal "Yoghurt", dessert.name
    assert_equal 100, dessert.calories
  end
  
  def test_setters
    dessert = Dessert.new("Yoghurt", 100)
    dessert.name = "Strawberries"
    dessert.calories = 75
    
    assert_equal "Strawberries", dessert.name
    assert_equal 75, dessert.calories
  end
  
  def test_healthy
    dessert = Dessert.new("Yoghurt", 199)
    
    assert_equal true, dessert.healthy?
  end
  
  def test_unhealthy
    dessert = Dessert.new("Cookies", 200)
    
    assert_equal false, dessert.healthy?
  end
  
  def test_delicous
    dessert = Dessert.new("Yoghurt", 100)
    
    assert_equal true, dessert.delicious?
  end
  
  def test_jellybean_not_delicious
    jellybean = JellyBean.new("black licorice ", 100, "black licorice")
    
    assert_equal false, jellybean.delicious?
  end
  
  def test_jellybean_delicious
    jellybean = JellyBean.new("black licorice ", 100, "raspberry")
    
    assert_equal true, jellybean.delicious?
  end
  
  def test_jellybean_accessor
    jellybean = JellyBean.new("black licorice ", 100, "raspberry")
	
	assert_equal "raspberry", jellybean.flavor
	
	jellybean.flavor = "vanilla"
	assert_equal "vanilla", jellybean.flavor
  end
  
end
