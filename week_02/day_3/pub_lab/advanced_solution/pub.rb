class Pub

  attr_reader :name, :till, :stock

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
  end

  def stock_level(drink)
    if @stock.include?(drink)
      return @stock[drink]
    end
    return 0
  end


  def stock_value()
    total = 0
    for drink in @stock.keys
      total += (drink.price * @stock[drink])
    end
    return total
  end

  def serve(customer, drink)
    return if customer_too_young?(customer)
    return if customer_too_drunk?(customer)
    if @stock.include?(drink)
      customer.buy_drink(drink)
      @stock[drink] -= 1
      @till += drink.price()
    end
  end

  def customer_too_young?(customer)
    return customer.age < 18
  end

  def customer_too_drunk?(customer)
    return customer.drunkenness >= 50
  end

end
