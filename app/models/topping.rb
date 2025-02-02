class Topping
  attr_reader :name, :price, :type

  def initialize(name)
    if MenuData.toppings["vegetarian"].key?(name)
      @name = name
      @price = MenuData.toppings["vegetarian"][name]
      @type = "veg"
    elsif MenuData.toppings["non_vegetarian"].key?(name)
      @name = name
      @price = MenuData.toppings["non_vegetarian"][name]
      @type = "non-veg"
    else
      raise ArgumentError, "Invalid topping: #{name}"
    end
  end
end

