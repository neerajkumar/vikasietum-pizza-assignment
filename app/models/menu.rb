class Menu
  attr_reader :pizzas, :sides

  def initialize
    load_pizzas
    load_sides
  end

  def create_pizza(name, size, crust, toppings = [])
    type = pizza_type(name)

    raise ArgumentError, "Pizza not found in menu" unless type

    type == "vegetarian" ? VegetarianPizza.new(name, size, crust, toppings) : NonVegetarianPizza.new(name, size, crust, toppings)
  end

  def get_side(name)
    find_side(name) || raise(ArgumentError, "Side not found in menu")
  end

  private

  def load_pizzas
    @pizzas = {
      "vegetarian" => MenuData.pizzas["vegetarian"].keys,
      "non_vegetarian" => MenuData.pizzas["non_vegetarian"].keys
    }
  end

  def load_sides
    @sides = MenuData.sides.transform_keys { |name| Side.new(name) }
  end

  def find_side(name)
    @sides.keys.find {|side| side.name == name}
  end

  def pizza_type(name)
    return "vegetarian" if @pizzas["vegetarian"].include?(name)
    return "non_vegetarian" if @pizzas["non_vegetarian"].include?(name)
    nil
  end
end

