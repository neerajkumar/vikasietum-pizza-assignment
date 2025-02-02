require 'rails_helper'

RSpec.describe Crust, type: :model do
  it "creates a valid crust with the correct price" do
    crust = Crust.new("Cheese Burst")
    expect(crust.name).to eq("Cheese Burst")
    expect(crust.price).to eq(40)
  end

  it "raises an error for an invalid crust" do
    expect { Crust.new("Garlic Crust") }.to raise_error(ArgumentError, /Invalid crust type/)
  end
end
