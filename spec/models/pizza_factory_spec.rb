require 'rails_helper'

RSpec.describe PizzaFactory do
  let(:factory) { PizzaFactory.new }
  let(:order_details) do
    {
      pizzas: [{ name: "Deluxe Veggie", size: "medium", crust: "Cheese Burst", toppings: ["Black Olive"] }],
      sides: ["Cold Drink"]
    }
  end

  it "places a valid order successfully" do
    allow_any_instance_of(Inventory).to receive(:check_availability?).and_return(true)
    expect { factory.place_order(order_details) }.to output(/Order confirmed!/).to_stdout
  end

  it "rejects an order if inventory is insufficient" do
    allow_any_instance_of(Inventory).to receive(:check_availability?).and_return(false)
    expect { factory.place_order(order_details) }.to output(/Order could not be processed due to inventory or validation issues./).to_stdout
  end
end
