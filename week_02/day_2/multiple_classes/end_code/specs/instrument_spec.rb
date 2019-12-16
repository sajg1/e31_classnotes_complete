require("minitest/autorun")
require("minitest/rg")

require_relative("../instrument")

class InstrumentTest < MiniTest::Test

  def setup
    @instrument = Instrument.new("guitar")
  end

  def test_has_type
    assert_equal("guitar", @instrument.type)
  end

  def test_can_make_sound
    assert_equal("I'm playing Stairway to Heaven!", @instrument.make_sound("Stairway to Heaven"))
  end

  def test_can_make_sound__piano
    piano = Instrument.new("piano")
    assert_equal("Plink plonk... I'm playing Ordinary People!", piano.make_sound("Ordinary People"))
  end

end
