class Car
  attr_reader :make, :model
  attr_accessor :engine, :gearbox
  
  def initialize(make, model, engine, gearbox)
    @make = make
    @model = model
    @engine = engine
    @gearbox = gearbox
  end

  def start
    @engine.start()
  end

  def change_gear(gear) 
    @gearbox.change_gear(gear)
  end
end