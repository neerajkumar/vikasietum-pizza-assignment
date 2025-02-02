require 'rails_helper'

RSpec.describe Pizza, type: :model do
  class TestPizza < Pizza
    def price
      100
    end

    def valid_toppings?
      true
    end
  end

  let(:crust) { Crust.new("Cheese Burst") }
  let(:toppings) { [Topping.new("Black Olive")] }
  let(:pizza) { TestPizza.new("medium", crust, toppings) }

  it "initializes a pizza with the correct attributes" do
    expect(pizza.size.to_sym).to eq(:medium)
    expect(pizza.crust.name).to eq("Cheese Burst")
    expect(pizza.toppings.first.name).to eq("Black Olive")
  end

  it "raises an error if price method is not implemented in subclass" do
    class InvalidPizza < Pizza; end
    expect { InvalidPizza.new("medium", crust, toppings).price }.to raise_error(NotImplementedError)
  end
end
