class NonVegetarianPizza < Pizza
  attr_reader :name, :size, :crust, :toppings

  def initialize(name, size, crust, toppings = [])
    unless MenuData.pizzas["non_vegetarian"].key?(name) && MenuData.pizzas["non_vegetarian"][name].key?(size)
      raise ArgumentError, "Invalid pizza name or size"
    end

    @name = name
    @size = size.to_sym
    @crust = Crust.new(crust)
    @toppings = toppings.map { |t| Topping.new(t) }

    validate_toppings!
  end

  def price
    base_price = MenuData.pizzas["non_vegetarian"][@name][@size.to_s] + @crust.price
    base_price += @toppings.sum(&:price) unless @size == :large
    base_price
  end

  def valid_toppings?
    @toppings.none? { |topping| topping.name == 'paneer' } &&
    @toppings.count { |topping| topping.type == 'non-veg' } <= 1
  end

  private

  def validate_toppings!
    if @toppings.any? { |t| t.name == "Paneer" }
      raise ArgumentError, "Non-vegetarian pizza cannot have Paneer topping!"
    end

    if @toppings.count { |t| t.type == "non-veg" } > 1
      raise ArgumentError, "Only one non-veg topping can be added to a non-vegetarian pizza!"
    end
  end
end
