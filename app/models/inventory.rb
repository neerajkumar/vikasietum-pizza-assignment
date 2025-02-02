class Inventory
  attr_reader :stock

  def initialize
    @stock = {
      "dough" => 100,
      "cheese" => 50,
      "veggies" => 80,
      "paneer" => 40,
      "chicken" => 60,
      "chicken tikka" => 60,
      "mushroom" => 40
    }

    # Adding all sides from MenuData dynamically
    MenuData.sides.keys.each { |side| @stock[side.downcase] = 30 }
  end

  def check_availability?(order)
    required_stock = calculate_required_stock(order)
    required_stock.all? { |item, qty| @stock[item] && @stock[item] >= qty }
  end

  def update_stock(order)
    required_stock = calculate_required_stock(order)
    required_stock.each { |item, qty| @stock[item.to_s] -= qty if @stock[item] }
  end

  def restock(item, quantity)
    @stock[item] = (@stock[item] || 0) + quantity
  end

  private

  def calculate_required_stock(order)
    stock_usage = Hash.new(0)

    order.pizzas.each do |pizza|
      stock_usage["dough"] += 1
      stock_usage["cheese"] += 1

      pizza.toppings.each do |topping|
        stock_usage[topping.name.downcase] += 1
      end
    end

    order.sides.each do |side|
      stock_usage[side.name.downcase] += 1
    end

    stock_usage
  end
end

