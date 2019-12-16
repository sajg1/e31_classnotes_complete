require('minitest/autorun')
require('minitest/rg')
require_relative('../gearbox.rb')


class TestGearbox < Minitest::Test
  def setup
    @gearbox = Gearbox.new("manual", 3)
  end

  def test_gearbox_has_type
    assert_equal("manual", @gearbox.type)
  end

  def test_gearbox_has_number_of_gears
    assert_equal(3, @gearbox.number_of_gears)
  end

  def test_gearbox_starts_in_neutral
    assert_equal("N", @gearbox.current_gear)
  end

  def test_gearbox_can_change_gear
    @gearbox.change_gear(2)
    assert_equal(2, @gearbox.current_gear)
  end

end