class Order
  attr_accessor :pizzas, :sides

  def initialize(order_details, menu)
    @pizzas = order_details[:pizzas].map { |pizza|
      menu.create_pizza(
        pizza[:name],
        pizza[:size],
        pizza[:crust],
        pizza[:toppings]
      )
    }
    @sides = order_details[:sides].map { |side| menu.get_side(side) }
  end

  def valid?
    @pizzas.all?(&:valid_toppings?)
  end

  def total_price
    pizza_price = @pizzas.sum(&:price)
    sides_price = @sides.sum(&:price)
    pizza_price + sides_price
  end

  def confirm
    puts "Your order has been placed!"
    puts "Total price: #{total_price}"
  end
end


