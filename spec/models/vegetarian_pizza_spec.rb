require 'rails_helper'

RSpec.describe VegetarianPizza, type: :model do
  let(:valid_toppings) { ["Black Olive", "Capsicum"] }
  let(:invalid_toppings) { ["Chicken Tikka"] }

  it "creates a valid vegetarian pizza" do
    pizza = VegetarianPizza.new("Deluxe Veggie", "medium", "Cheese Burst", valid_toppings)
    expect(pizza.name).to eq("Deluxe Veggie")
    expect(pizza.size).to eq(:medium)
    expect(pizza.crust.name).to eq("Cheese Burst")
    expect(pizza.price).to eq(200 + 40 + 20 + 25) # base + crust + toppings
  end

  it "raises an error if non-veg topping is added" do
    expect {
      VegetarianPizza.new("Deluxe Veggie", "medium", "Cheese Burst", invalid_toppings)
    }.to raise_error(ArgumentError, /Vegetarian pizza cannot have non-veg toppings!/)
  end
end
