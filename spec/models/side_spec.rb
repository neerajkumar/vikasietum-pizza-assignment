require 'rails_helper'

RSpec.describe Side, type: :model do
  it "creates a valid side item with the correct price" do
    side = Side.new("Cold Drink")
    expect(side.name).to eq("Cold Drink")
    expect(side.price).to eq(55)
  end

  it "raises an error for an invalid side" do
    expect { Side.new("Ice Cream") }.to raise_error(ArgumentError, /Invalid side item/)
  end
end
