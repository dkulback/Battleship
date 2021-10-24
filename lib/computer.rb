require 'board'

class Computer
  attr_reader :computer, :cells
  def initialize
    @computer = Board.new
  end

  def random_ship(ship)
    require "pry"; binding.pry
  end

end
