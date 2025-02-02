require 'rails_helper'

RSpec.describe NonVegetarianPizza, type: :model do
  let(:valid_toppings) { ["Chicken Tikka"] }
  let(:invalid_toppings) { ["Paneer"] }
  let(:extra_non_veg_toppings) { ["Chicken Tikka", "Grilled Chicken"] }

  it "creates a valid non-vegetarian pizza" do
    pizza = NonVegetarianPizza.new("Chicken Tikka", "large", "Fresh Pan Pizza", valid_toppings)
    expect(pizza.name).to eq("Chicken Tikka")
    expect(pizza.size).to eq(:large)
    expect(pizza.crust.name).to eq("Fresh Pan Pizza")
    expect(pizza.price).to eq(500 + 30) # base + crust (toppings free for large size)
  end

  it "raises an error if Paneer is added" do
    expect {
      NonVegetarianPizza.new("Chicken Tikka", "medium", "Wheat Thin Crust", invalid_toppings)
    }.to raise_error(ArgumentError, /Non-vegetarian pizza cannot have Paneer topping!/)
  end

  it "raises an error if more than one non-veg topping is added" do
    expect {
      NonVegetarianPizza.new("Chicken Tikka", "medium", "Cheese Burst", extra_non_veg_toppings)
    }.to raise_error(ArgumentError, /Only one non-veg topping can be added to a non-vegetarian pizza!/)
  end
end
