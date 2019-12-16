require('minitest/autorun')
require('minitest/rg')
require_relative('../vehicle.rb')

class TestVehicle < Minitest::Test
  def setup
    @vehicle = Vehicle.new()
  end

  def test_vehicle_can_start_engine
    assert_equal("Vrrmmm", @vehicle.start_engine)
  end
end
