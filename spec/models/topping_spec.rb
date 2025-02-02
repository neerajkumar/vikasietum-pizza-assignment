require 'rails_helper'

RSpec.describe Topping, type: :model do
  it "creates a valid vegetarian topping" do
    topping = Topping.new("Black Olive")
    expect(topping.name).to eq("Black Olive")
    expect(topping.price).to eq(20)
    expect(topping.type).to eq("veg")
  end

  it "creates a valid non-vegetarian topping" do
    topping = Topping.new("Chicken Tikka")
    expect(topping.name).to eq("Chicken Tikka")
    expect(topping.price).to eq(35)
    expect(topping.type).to eq("non-veg")
  end

  it "raises an error for an invalid topping" do
    expect { Topping.new("Pineapple") }.to raise_error(ArgumentError, /Invalid topping/)
  end
end
