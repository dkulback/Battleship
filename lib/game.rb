require './lib/ship'
require './lib/board'

class Game
  attr_reader :player_board,
              :computer_board,
              :cruiser,
              :submarine,
              :comp_cruiser,
              :comp_submarine

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser_2 = Ship.new("Cruiser", 3)
    @submarine_2 = Ship.new("Submarine", 2)
  end

  def welcome_message
    puts "Welcome to"
    puts "BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    response = gets.chomp.downcase
      if response == "p"
        start_game
      elsif response == "q"
        puts "Game ending..."
        exit
      else
        exit 
      end
  end

  def render_boards
    puts "-----------COMPUTER BOARD-------------"
    puts @computer_board.render
    puts "-----------PLAYER BOARD---------------"
    puts @player_board.render(true)
    puts "=" * 60
  end

  def start_game
    puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n#{@player_board.render}\nEnter the squares for the Cruiser (3 spaces). \nExample: a1 b1 c1"
    user_cruiser = gets.chomp.upcase.split.sort

    @player_board.valid_placement?(@cruiser, user_cruiser)
    until @player_board.valid_placement?(@cruiser, user_cruiser) == true
      puts "Invalid placement. Please enter valid placement for your cruiser(3 coordinates) \n>"
      user_cruiser = gets.chomp.upcase.split.sort
      @player_board.valid_placement?(@cruiser, user_cruiser)
    end
      @player_board.place(@cruiser, user_cruiser)

    puts "Now place your submarine(2 coordinates)"

    user_submarine = gets.chomp.upcase.split.sort
    @player_board.valid_placement?(@submarine, user_submarine)
    until @player_board.valid_placement?(@submarine, user_submarine) == true
      puts "Invalid placement. Please enter valid placement for your cruiser(2 coordinates)"
      user_submarine = gets.chomp.upcase.split.sort
      @player_board.valid_placement?(@submarine, user_submarine)
    end
      @player_board.place(@submarine, user_submarine)
      render_boards
  end

  def user_turn_fire
    puts "Bad Person: TRY TO SINK ALL OF MY SHIPS IF YOU CAN MUAHAHAHA!"
    puts "Pick the coordinate of the bad guy that you want to fire at!"

    user_fire = gets.chomp.upcase
    until @computer_board.valid_coordinate?(user_fire) == true && @computer_board.cells[user_fire].fired_upon? == false
      if @computer_board.valid_coordinate?(user_fire) == false
      puts "Please enter a valid coordinate"
      elsif @computer_board.cells[user_fire].fired_upon? == true
        puts "You have already fired at this coordinate. Please pick another one."
      end
      user_fire = gets.chomp.upcase
    end

    @computer_board.fire(user_fire)

    if @computer_board.cells[user_fire].render == "M"
      puts "Your shot at #{user_fire} was a miss."
    elsif @computer_board.cells[user_fire].render == "H"
      puts "Your shot at #{user_fire} was a hit!."
    elsif @computer_board.cells[user_fire].render == "X"
      puts "You sunk my battleship!"
    end
  end

  def computer_fire
    puts "Computer will fire at you."

    comp_fire = @player_board.cells.keys.sample
    until @player_board.cells[comp_fire].fired_upon? == false
      comp_fire = @player_board.cells.keys.sample
    end

    @player_board.fire(comp_fire)
    if @player_board.cells[comp_fire].render == "M"
      puts "My shot at #{comp_fire} was a miss."
    elsif @player_board.cells[comp_fire].render == "H"
      puts "My shot at #{comp_fire} was a hit!."
    elsif @player_board.cells[comp_fire].render == "X"
      puts "I sunk your battleship!"
    end
  end

  def turns
    until (@cruiser.sunk? && @submarine.sunk?) || (@cruiser_2.sunk? && @submarine_2.sunk?)
      user_turn_fire
      computer_fire
      render_boards
    end
  end

  def game_over
    if @cruiser.sunk? && @submarine.sunk?
      puts "HAHA I win."
    elsif @cruiser_2.sunk? && @submarine_2.sunk?
      puts "Oh woooooww youre awesome. Would you like a cookie?"
    end
  end

  def valid_placement_creator(ship)
    valid_sub_placements = [['A1', 'A2'], ['A2', 'A3'], ['A3','A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3','B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3','C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3','D4'], ['A1', 'B1'], ['B1', 'C1'], ['C1','D1'], ['A2', 'B2'], ['B2', 'C2'], ['C2','D2'], ['A3', 'B3'], ['B3', 'C3'], ['C3','D3'], ['A4', 'B4'], ['B4', 'C4'], ['C4','D4']]

    valid_cruiser_placements = [["A2", "A3", "A4"], [ "B2", "B3","B4"], [ "C2", "C3","C4"], [ "D2", "D3","D4"], ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], ["A4", "B4", "C4"], ["A2", "A3", "A4"], ["B2", "B3", "B4"], [ "C2", "C3", "C4"], [ "D2", "D3", "D4"], [ "B1", "C1", "D1"], [ "B2", "C2", "D2"], [ "B3", "C3", "D3"], ["B4", "C4", "D4"]]

    if ship.length == 2
      valid_sub_placements.sample(1).flatten
    elsif ship.length == 3
      valid_cruiser_placements.sample(1).flatten
    end
    ## We know this works it just takes forever to test
    # valid_random_position = @computer_board.cells.keys.sample(ship.length)
    #
    # until @computer_board.valid_placement?(ship, valid_random_position) == true
    #  valid_random_position = @computer_board.cells.keys.sample(ship.length)
    #
    #  puts valid_random_position
    # end
    # valid_random_position
  end

  def comp_ship_generator
    comp_cruiser = valid_placement_creator(@cruiser_2)
    @computer_board.valid_placement?(@cruiser_2, comp_cruiser)

    until @computer_board.valid_placement?(@cruiser_2, comp_cruiser) == true
      comp_cruiser = valid_placement_creator(@cruiser_2)
      @computer_board.valid_placement?(@cruiser_2, comp_cruiser)
    end
    @computer_board.place(@cruiser_2, comp_cruiser)

    comp_sub = valid_placement_creator(@submarine_2)
    @computer_board.valid_placement?(@submarine_2, comp_sub)

    until @computer_board.valid_placement?(@submarine_2, comp_sub) == true
      comp_sub = valid_placement_creator(@submarine_2)
      @computer_board.valid_placement?(@submarine_2, comp_sub)
    end
      @computer_board.place(@submarine_2, comp_sub)
  end
end
