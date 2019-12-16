require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class FoodTest < MiniTest::Test

  def setup()
    @food = Food.new("Burger", 4.99, 3)
  end

  def test_has_name()
    assert_equal("Burger", @food.name)
  end

  def test_has_price()
    assert_equal(4.99, @food.price)
  end

  def test_has_rejuvination_level()
    assert_equal(3, @food.rejuvination_level)
  end

end
