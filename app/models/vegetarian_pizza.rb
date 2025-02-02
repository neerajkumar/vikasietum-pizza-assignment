class VegetarianPizza < Pizza
  attr_reader :name, :size, :crust, :toppings

  def initialize(name, size, crust, toppings = [])
    unless MenuData.pizzas["vegetarian"].key?(name) && MenuData.pizzas["vegetarian"][name].key?(size)
      raise ArgumentError, "Invalid pizza name or size"
    end

    @name = name
    @size = size.to_sym
    @crust = Crust.new(crust)
    @toppings = toppings.map { |t| Topping.new(t) }

    validate_toppings!
  end

  def price
    base_price = MenuData.pizzas["vegetarian"][@name][@size.to_s] + @crust.price
    base_price += @toppings.sum(&:price) unless @size == :large
    base_price
  end

  def valid_toppings?
    @toppings.all? { |topping| topping.type == 'veg' }
  end

  private

  def validate_toppings!
    if @toppings.any? { |t| t.type == "non-veg" }
      raise ArgumentError, "Vegetarian pizza cannot have non-veg toppings!"
    end
  end
end
