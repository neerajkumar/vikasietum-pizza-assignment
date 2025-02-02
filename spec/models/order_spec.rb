require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:menu) { Menu.new }
  let(:order_details) do
    {
      pizzas: [
        { name: "Deluxe Veggie", size: "medium", crust: "Cheese Burst", toppings: ["Black Olive"] },
        { name: "Chicken Tikka", size: "large", crust: "Fresh Pan Pizza", toppings: ["Chicken Tikka"] }
      ],
      sides: ["Cold Drink"]
    }
  end

  let(:order) { Order.new(order_details, menu) }

  it "initializes an order with pizzas and sides" do
    expect(order.pizzas.size).to eq(2)
    expect(order.sides.size).to eq(1)
  end

  it "validates the order successfully" do
    expect(order.valid?).to be_truthy
  end

  it "calculates the correct total price" do
    expected_price = 200 + 40 + 20 + 500 + 30 + 55 # Medium Deluxe Veggie + Large Chicken Tikka + Cold Drink
    expect(order.total_price).to eq(expected_price)
  end

  it "confirms the order successfully" do
    expect { order.confirm }.to output(/Your order has been placed!/).to_stdout
  end
end
