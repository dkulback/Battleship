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
    until @player_board.valid_placement?(@cruiser, user_cruiser) == true
      puts "Invalid placement. Please enter valid placement for your cruiser(3 coordinates)\n>"
      user_cruiser = gets.chomp.upcase.split
    end

    puts "Now place your submarine(2 coordinates)"
    user_submarine = gets.chomp.upcase.split
    until @player_board.valid_placement?(@submarine, user_submarine) == true
      puts "Invalid placement. Please enter valid placement for your cruiser(3 coordinates)\n>"
      user_submarine = gets.chomp.upcase.split
    end
  end


  def valid_placement_creator(ship)
    valid_sub_placements = [['A1', 'A2'], ['A2', 'A3'], ['A3','A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3','B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3','C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3','D4'], ['A1', 'B1'], ['B1', 'C1'], ['C1','D1'], ['A2', 'B2'], ['B2', 'C2'], ['C2','D2'], ['A3', 'B3'], ['B3', 'C3'], ['C3','D3'], ['A4', 'B4'], ['B4', 'C4'], ['C4','D4']]

    valid_cruiser_placements = battleship_array= [["A2", "A3", "A4"], [ "B2", "B3","B4"], [ "C2", "C3","C4"], [ "D2", "D3","D4"], ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], ["A4", "B4", "C4"], ["A2", "A3", "A4"], ["B2", "B3", "B4"], [ "C2", "C3", "C4"], [ "D2", "D3", "D4"], [ "B1", "C1", "D1"], [ "B2", "C2", "D2"], [ "B3", "C3", "D3"], ["B4", "C4", "D4"]]

    if ship.length == 2
      valid_sub_placements.sample(1).flatten
    elsif ship.length == 3
      valid_cruiser_placements.sample(1).flatten
    end
    # valid_random_position = @computer_board.cells.keys.sample(ship.length)
    #
    # until @computer_board.valid_placement?(ship, valid_random_position) == true
    #   valid_random_position =  @computer_board.cells.keys.sample(ship.length)
    #
    #   puts valid_random_position
    # end
    # valid_random_position
  end
end
