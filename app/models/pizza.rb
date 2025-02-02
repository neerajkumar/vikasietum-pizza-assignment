class Pizza
  attr_accessor :size, :crust, :toppings

  def initialize(size, crust, toppings)
    @size = size
    @crust = crust
    @toppings = toppings
  end

  def price
    raise NotImplementedError, 'Subclasses must implement price method'
  end

  def valid_toppings?
    raise NotImplementedError, 'Subclasses must implement topping validation'
  end
end
