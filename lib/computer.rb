class Computer
  attr_reader :computer, :cells

  def initialize
    @computer = Board.new
  end

  def welcome_message
    puts "Welcome to Battleship"
    puts "Enter p to play. Enter q to quit"
  end

  def random_ships
    until valid_placement?(ship_position) == true
    ship_postion = @cells.to_a.sample(3).to_h.keys
    valid_placement(ship_postion)
    end
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)


    @computer.place(cruiser, [])
  end




end
