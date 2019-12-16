require_relative('vehicle.rb')

class Car < Vehicle
  attr_reader :model

  def initialize(model)
    @model = model
  end
  
end
