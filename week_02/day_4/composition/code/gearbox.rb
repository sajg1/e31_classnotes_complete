class Gearbox
  attr_reader :type, :number_of_gears, :current_gear

  def initialize(type,number_of_gears)
    @type = type
    @number_of_gears = number_of_gears
    @current_gear = "N"
  end

  def change_gear(gear)
    @current_gear = gear
  end
end