class Ship
  attr_reader :name,
              :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    @length
  end

  def hit
    require "pry"; binding.pry
    self.health - 1
  end
end
