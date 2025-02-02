class PizzaFactory
  attr_reader :menu, :inventory

  def initialize
    @menu = Menu.new
    @inventory = Inventory.new
  end

  def place_order(order_details)
    order = Order.new(order_details, @menu)

    if order.valid? && @inventory.check_availability?(order)
      @inventory.update_stock(order)
      order.confirm
      puts "Order confirmed!"
    else
      puts "Order could not be processed due to inventory or validation issues."
    end
  end

  def restock_inventory(item, quantity)
    @inventory.restock(item, quantity)
  end

  def add_to_menu(item)
    @menu.add(item)
  end
end

