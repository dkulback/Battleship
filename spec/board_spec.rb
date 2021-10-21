require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cell = Cell.new("A1")
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it '#create_cells' do
    @board.create_cells
    expect(@board.cells).to eq({"A1" => Cell.new("A1")})
  end
end
