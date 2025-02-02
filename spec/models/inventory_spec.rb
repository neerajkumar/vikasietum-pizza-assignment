require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:inventory) { Inventory.new }

  it "checks stock availability for a valid order" do
    order = double("Order", pizzas: [], sides: [])
    allow(inventory).to receive(:check_availability?).with(order).and_return(true)
    expect(inventory.check_availability?(order)).to be_truthy
  end

  it "reduces stock when an order is placed" do
    order = double("Order", pizzas: [], sides: [])
    allow(inventory).to receive(:calculate_required_stock).and_return({ "cheese" => 2 })
    expect { inventory.update_stock(order) }.to change { inventory.stock["cheese"] }.by(-2)
  end

  it "restocks an item successfully" do
    expect { inventory.restock("cheese", 10) }.to change { inventory.stock["cheese"] }.by(10)
  end
end
