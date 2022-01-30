require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cell = Cell.new('A1')
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it '#has cells' do
    expect(@board.cells['A1']).to be_an_instance_of(Cell)
    expect(@board.cells['D4']).to be_an_instance_of(Cell)
  end

  it '#valid_coordinate?' do
    expect(@board.valid_coordinate?('A1')).to eq(true)
    expect(@board.valid_coordinate?('D4')).to eq(true)
    expect(@board.valid_coordinate?('A5')).to eq(false)
    expect(@board.valid_coordinate?('E1')).to eq(false)
    expect(@board.valid_coordinate?('A22')).to eq(false)
  end

  describe '#valid_placement' do
    it 'checks if ship length is valid' do
      expect(@board.valid_placement?(@cruiser, %w[A1 A2])).to be(false)
      expect(@board.valid_placement?(@submarine, %w[A2 A3 A4])).to be(false)
    end

    it '#horizontal_check' do
      example_1 = %w[A1 A2]
      example_2 = %w[A1 A2 A4]
      expect(@board.horizontal_check(example_1)).to eq(true)
      expect(@board.horizontal_check(example_2)).to eq(false)
    end

    it '#vertical_check' do
      example_1 = %w[A1 B1]
      example_2 = %w[A1 B1 D1]
      expect(@board.vertical_check(example_1)).to eq(true)
      expect(@board.vertical_check(example_2)).to eq(false)
    end

    it '#diagonal_check' do
      example_1 = %w[C2 D4]
      example_2 = %w[A1 B2 D3]
      example_4 = %w[A1 B2 C3]
      expect(@board.diagonal_check(example_1)).to eq(false)
      expect(@board.diagonal_check(example_2)).to eq(false)
      expect(@board.diagonal_check(example_4)).to eq(false)
    end

    it 'checks if coordinates are not consecutive' do
      expect(@board.valid_placement?(@cruiser, %w[A1 A2 A4])).to be(false)
      expect(@board.valid_placement?(@submarine, %w[A1 C1])).to be(false)
      expect(@board.valid_placement?(@cruiser, %w[A3 A2 A1])).to be(false)
      expect(@board.valid_placement?(@submarine, %w[C1 B1])).to be(false)
    end

    it 'checks that coordinates are not diagonal' do
      expect(@board.valid_placement?(@cruiser, %w[A1 B2 C3])).to be(false)
      expect(@board.valid_placement?(@submarine, %w[C2 D4])).to be(false)
    end

    it 'checks for no overlapping ships' do
      @board.place(@cruiser, %w[A1 A2 A3])

      expect(@board.valid_placement?(@submarine, %w[A1 B1])).to eq(false)
    end
  end

  describe '#place_ship' do
    it 'places a ship' do
      @board.place(@cruiser, %w[A1 A2 A3])
      cell_1 = @board.cells['A1']
      cell_2 = @board.cells['A2']
      cell_3 = @board.cells['A3']
      cell_4 = @board.cells['A4']
      expect(cell_1.ship).to eq(@cruiser)
      expect(cell_2.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(cell_2.ship)
      expect(cell_4.ship).to eq(nil)
      expect(cell_3.ship).to eq(cell_2.ship)
    end
  end

  describe '#fire' do
    it 'fires on a coordinate' do
      @board.place(@cruiser, %w[A1 A2 A3])
      cell_1 = @board.cells['A1']
      @board.fire('A1')
      expect(cell_1.fired_upon?).to be(true)
      expect(cell_1.ship.health).to eq(2)
    end
  end

  describe '#render' do
    it 'renders player board' do
      @board.place(@cruiser, %w[A1 A2 A3])

      expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'render with optionial true' do
      @board.place(@cruiser, %w[A1 A2 A3])
      expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'renders board with hits and misses and sunken ships' do
      @board.place(@cruiser, %w[A1 A2 A3])
      @board.fire('A1')
      expect(@board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n")

      @board.fire('A4')
      expect(@board.render).to eq("  1 2 3 4 \nA H . . M \nB . . . . \nC . . . . \nD . . . . \n")

      @board.fire('A2')
      @board.fire('A3')
      expect(@board.render).to eq("  1 2 3 4 \nA X X X M \nB . . . . \nC . . . . \nD . . . . \n")

      @board.place(@submarine, %w[B1 B2])
      @board.fire('B1')
      @board.fire('B3')
      expect(@board.render).to eq("  1 2 3 4 \nA X X X M \nB H . M . \nC . . . . \nD . . . . \n")
    end
  end
end
