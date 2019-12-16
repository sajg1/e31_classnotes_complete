require("minitest/autorun")
require('minitest/rg')
require_relative("../customer")
require_relative("../drink")
require_relative("../food")

class CustomerTest < MiniTest::Test

  def setup
    @drink = Drink.new("beer", 2.0, 5)
    @food = Food.new("Burger", 4.99, 3)
    @customer = Customer.new("Frodo", 10.0, 28, 0)
    @customer2 = Customer.new("Sam", 10.0, 27, 5)
  end

  def test_customer_has_name
    assert_equal("Frodo", @customer.name())
  end

  def test_customer_has_money
    assert_equal(10.0, @customer.wallet())
  end

  def test_customer_has_age
    assert_equal(28, @customer.age())
  end

  def test_customer_has_drunkenness
    assert_equal(0, @customer.drunkenness())
  end

  def test_sufficient_funds__true_if_enough
    assert_equal(true, @customer.sufficient_funds?(@drink))
  end

  def test_sufficient_funds__false_if_not_enough
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    assert_equal(false, @customer.sufficient_funds?(@drink))
  end

  def test_customer_can_buy_drink__decreases_money
    @customer.buy_drink(@drink)
    assert_equal(8.0, @customer.wallet())
  end

  def test_customer_can_buy_drink__increases_drunkenness
    @customer.buy_drink(@drink)
    assert_equal(5, @customer.drunkenness())
  end

  def test_customer_cannot_buy_if_insufficient_funds
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    @customer.buy_drink(@drink)
    assert_equal(0.0, @customer.wallet())
    assert_equal(25, @customer.drunkenness())
  end

  def test_customer_can_buy_food_decreases_money
    @customer2.buy_food(@food)
    assert_equal(5.01, @customer2.wallet())
  end


  def test_customer_can_buy_food_decreases_drunkedness
    @customer2.buy_food(@food)
    assert_equal(2, @customer2.drunkenness)
  end

  def test_sufficient_food_funds__true_if_enough
    assert_equal(true, @customer.sufficient_funds?(@food))
  end

  def test_sufficient_food_funds__false_if_not_enough
    @customer.buy_food(@food)
    @customer.buy_food(@food)
    assert_equal(false, @customer.sufficient_funds?(@food))
  end

end
