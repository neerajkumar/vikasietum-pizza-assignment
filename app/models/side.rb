class Side
  attr_reader :name, :price

  def initialize(name)
    unless MenuData.sides.key?(name)
      raise ArgumentError, "Invalid side item: #{name}"
    end

    @name = name
    @price = MenuData.sides[name]
  end
end
