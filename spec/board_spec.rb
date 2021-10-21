require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cell_1 = Cell.new("A1")
    @cell_2 = Cell.new("A2")
    @cell_3 = Cell.new("A3")
    @cell_4 = Cell.new("A4")
    @cell_5= Cell.new("B1")
    @cell_6= Cell.new("B2")
    @cell_7= Cell.new("B3")
    @cell_8= Cell.new("B4")
    @cell_9= Cell.new("C1")
    @cell_10= Cell.new("C2")
    @cell_11= Cell.new("C3")
    @cell_12= Cell.new("C4")
    @cell_13= Cell.new("D1")
    @cell_14= Cell.new("D2")
    @cell_15= Cell.new("D3")
    @cell_16= Cell.new("D4")
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it '#create_cells' do
    @board.create_cells("A1")
    @board.create_cells("A2")
    @board.create_cells("A3")
    @board.create_cells("A4")
    @board.create_cells("B1")
    @board.create_cells("B2")
    @board.create_cells("B3")
    @board.create_cells("B4")
    @board.create_cells("C1")
    @board.create_cells("C2")
    @board.create_cells("C3")
    @board.create_cells("C4")
    @board.create_cells("D1")
    @board.create_cells("D2")
    @board.create_cells("D3")
    @board.create_cells("D4")


    expected = {
 "A1" => @cell_1,
 "A2" => @cell_2,
 "A3" => @cell_3,
 "A4" => @cell_4,
 "B1" => @cell_5,
 "B2" => @cell_6,
 "B3" => @cell_7,
 "B4" => @cell_8,
 "C1" => @cell_9,
 "C2" => @cell_10,
 "C3" => @cell_11,
 "C4" => @cell_12,
 "D1" => @cell_13,
 "D2" => @cell_14,
 "D3" => @cell_15,
 "D4" => @cell_16
}
    expect(@board.cells).to include(expected)
  end
end
