require './lib/ship'
require './lib/board'

class Game
  attr_reader :player_board,
              :computer_board,
              :cruiser,
              :submarine

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def welcome_message
    puts "Welcome to Battleship"
    puts "Enter p to play. Enter q to quit"
    response = gets.chomp.downcase
      if response == "p"
        start_game
      elsif response == "q"
        puts "Game ending.."
      end
  end

  def start_game
    puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n #{@player_board.render}\nEnter the squares for the Cruiser (3 spaces):\n>"

    user_cruiser = gets.chomp.upcase.split
    @player_board.valid_placement?(@cruiser, user_cruiser)
    until @player_board.valid_placement?(@cruiser, user_cruiser) == true
      puts "Invalid placement. Please enter valid placement for your cruiser(3 coordinates) \n>"
      user_cruiser = gets.chomp.upcase.split
      @player_board.valid_placement?(@cruiser, user_cruiser)
    end
    @player_board.place(@cruiser, user_cruiser)
<<<<<<< HEAD

=======
>>>>>>> 545bf170c385bcada50e61d7679be5952698b392

    puts "Now place your submarine(2 coordinates)"

    user_submarine = gets.chomp.upcase.split
    @player_board.valid_placement?(@submarine, user_submarine)
    until @player_board.valid_placement?(@submarine, user_submarine) == true
      puts "Invalid placement. Please enter valid placement for your cruiser(2 coordinates) \n>"
      user_submarine = gets.chomp.upcase.split
      @player_board.valid_placement?(@submarine, user_submarine)
    end
    @player_board.place(@submarine, user_submarine)

    puts "Great position.\n #{@player_board.render(true)}"

  end


  def valid_placement_creator(ship)
    valid_sub_placements = [['A1', 'A2'], ['A2', 'A3'], ['A3','A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3','B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3','C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3','D4'], ['A1', 'B1'], ['B1', 'C1'], ['C1','D1'], ['A2', 'B2'], ['B2', 'C2'], ['C2','D2'], ['A3', 'B3'], ['B3', 'C3'], ['C3','D3'], ['A4', 'B4'], ['B4', 'C4'], ['C4','D4']]

    valid_cruiser_placements = battleship_array= [["A2", "A3", "A4"], [ "B2", "B3","B4"], [ "C2", "C3","C4"], [ "D2", "D3","D4"], ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], ["A4", "B4", "C4"], ["A2", "A3", "A4"], ["B2", "B3", "B4"], [ "C2", "C3", "C4"], [ "D2", "D3", "D4"], [ "B1", "C1", "D1"], [ "B2", "C2", "D2"], [ "B3", "C3", "D3"], ["B4", "C4", "D4"]]

    if ship.length == 2
      valid_sub_placements.sample(1).flatten
    elsif ship.length == 3
      valid_cruiser_placements.sample(1).flatten
    end

  end

  def generator
  comp_cruiser = valid_placement_creator(@cruiser)
  @computer_board.valid_placement?(@cruiser, comp_cruiser)
  until @computer_board.valid_placement?(@cruiser, comp_cruiser) == true
    comp_cruiser = valid_placement_creator(@cruiser)
    @computer_board.valid_placement?(@cruiser, comp_cruiser)
  end
  @computer_board.place(@cruiser, comp_cruiser)

  comp_sub = valid_placement_creator(@submarine)
  @computer_board.valid_placement?(@submarine, comp_sub)
  until @computer_board.valid_placement?(@submarine, comp_sub) == true
    comp_sub = valid_placement_creator(@submarine)
    @computer_board.valid_placement?(@submarine, comp_sub)
  end
  @computer_board.place(@submarine, comp_sub)
  end

  def turn


  end
end
