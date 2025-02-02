require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { Menu.new }

  it "retrieves a vegetarian pizza from the menu" do
    expect(menu.pizzas["vegetarian"]).to include("Deluxe Veggie")
  end

  it "retrieves a non-vegetarian pizza from the menu" do
    expect(menu.pizzas["non_vegetarian"]).to include("Chicken Tikka")
  end

  it "creates a valid vegetarian pizza" do
    pizza = menu.create_pizza("Deluxe Veggie", "medium", "Cheese Burst", ["Black Olive"])
    expect(pizza).to be_a(VegetarianPizza)
    expect(pizza.price).to eq(200 + 40 + 20) # base + crust + topping
  end

  it "creates a valid non-vegetarian pizza" do
    pizza = menu.create_pizza("Chicken Tikka", "medium", "Fresh Pan Pizza", ["Chicken Tikka"])
    expect(pizza).to be_a(NonVegetarianPizza)
    expect(pizza.price).to eq(370 + 30 + 35) # base + crust + topping
  end

  it "raises an error when creating a non-existing pizza" do
    expect { menu.create_pizza("Hawaiian", "medium", "Cheese Burst") }.to raise_error(ArgumentError, /Pizza not found in menu/)
  end

  it "retrieves a valid side item" do
    side = menu.get_side("Cold Drink")
    expect(side.name).to eq("Cold Drink")
    expect(side.price).to eq(55)
  end

  it "raises an error when retrieving an invalid side item" do
    expect { menu.get_side("Ice Cream") }.to raise_error(ArgumentError, /Side not found in menu/)
  end
end
