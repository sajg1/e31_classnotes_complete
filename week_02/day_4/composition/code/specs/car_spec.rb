require('minitest/autorun')
require('minitest/rg')
require_relative('../engine.rb')
require_relative('../gearbox.rb')
require_relative('../car.rb')

class TestCar < Minitest::Test
  def setup
    @engine = Engine.new()
    @gearbox = Gearbox.new("manual", 5)
    @car = Car.new("Ford", "Escort", @engine, @gearbox)
  end

  def test_car_can_start
    assert_equal("Vrrrmmm!", @car.start)
  end

  def test_car_can_change_gear
    @car.change_gear(2)
    assert_equal(2, @car.gearbox.current_gear)
  end
end