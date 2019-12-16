class River

  def initialize(name, fishes)
    @name = name
    @fishes = fishes
  end

  def get_name()
    return @name
  end

  def number_of_fishes()
    return @fishes.size
  end

  def get_fish()
    return @fishes.pop
  end
end
