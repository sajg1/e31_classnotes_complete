require( 'minitest/autorun' )
require( 'minitest/emoji' )
require_relative('../my_functions.rb')

class FunctionsTest < MiniTest::Test

  def test_greet_craig
    # Arrange
    name = 'craig'
    time_of_day = 'evening'

    # Act
    result = greet(name, time_of_day)

    # Assert
    expected_result = 'Good evening, Craig'
    assert_equal(expected_result, result)
  end

  def test_add
    sum = add(4, 5)
    assert_equal(9, sum)
  end

  def test_add_1000_plus_4000
    assert_equal(5000, add(1000, 4000))
  end

  def test_add__negative
    assert_equal(-5, add(5, -10))
  end

end
