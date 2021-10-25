require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

RSpec.describe "it is a computer board" do
  it 'creates a computer set up' do
    @computer = Computer.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@computer).to be_a(Computer)
  end

  it 'creates valid placement' do
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer_board = Board.new

    x = computer.valid_placement_creator(cruiser)
    y = computer.valid_placement_creator(submarine)
    expect(computer_board.valid_placement?(cruiser, x)).to eq(true)
    expect(computer_board.valid_placement?(submarine, y)).to eq(true)
  end

end
