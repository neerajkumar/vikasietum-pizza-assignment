require 'yaml'

class MenuData
  def self.load_data
    @data ||= YAML.load_file(Rails.root.join('config/menu.yaml'))
  end

  def self.pizzas
    load_data["pizzas"]
  end

  def self.crusts
    load_data["crusts"]
  end

  def self.toppings
    load_data["toppings"]
  end

  def self.sides
    load_data["sides"]
  end
end
