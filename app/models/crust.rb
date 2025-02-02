class Crust
  attr_reader :name, :price

  def initialize(name)
    unless MenuData.crusts.key?(name)
      raise ArgumentError, "Invalid crust type: #{name}"
    end

    @name = name
    @price = MenuData.crusts[name]
  end
end
