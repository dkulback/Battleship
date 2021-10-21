require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cell = Cell.new("A1")
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it '#has cells' do
    expect(@board.cells["A1"]).to be_an_instance_of(Cell)
    expect(@board.cells["D4"]).to be_an_instance_of(Cell)
  end

  it '#valid_coordinate?' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  describe '#valid_placement' do
    it 'return a valid placed ship' do

      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
    end
  end



end
