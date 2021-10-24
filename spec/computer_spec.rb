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

  it 'places ships at random' do
    @computer = Computer.new
    @cruiser = Ship.new("Cruiser", 3)

    @computer.random_ships
    expect(@computer.include?(cruiser)).to eq(cruiser)
  end

end
