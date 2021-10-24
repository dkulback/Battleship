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

  xit 'places ships at random' do
    @computer = Computer.new
    @cruiser = Ship.new("Cruiser", 3)
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    cell_4 = @board.cells["A4"]
    @computer.random_ship(@cruiser)
    expect(cell_1).to eq(cruiser)
  end

end
