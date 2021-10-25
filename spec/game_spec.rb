require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe "it is a computer board" do
  it 'creates a computer set up' do
    @game = Game.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@game).to be_a(Game)
  end

  it 'creates valid placement' do
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer_board = Board.new

    x = game.valid_placement_creator(cruiser)
    y = game.valid_placement_creator(submarine)
    expect(computer_board.valid_placement?(cruiser, x)).to eq(true)
    expect(computer_board.valid_placement?(submarine, y)).to eq(true)
  end

end
