class Motorbike
  attr_reader :make, :model
  attr_accessor :engine
  
  def initialize(make, model, engine)
    @make = make
    @model = model
    @engine = engine
  end

  def start
    @engine.start()
  end

end