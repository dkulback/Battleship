class Board
  attr_reader :cells

  def initialize
    @cells = {"A1" => Cell.new('A1'),
    "A2" => Cell.new('A2'),
    "A3" => Cell.new('A3'),
    "A4" => Cell.new('A4'),
    "B1" => Cell.new('B1'),
    "B2" => Cell.new('B2'),
    "B3" => Cell.new('B3'),
    "B4" => Cell.new('B4'),
    "C1" => Cell.new('C1'),
    "C2" => Cell.new('C2'),
    "C3" => Cell.new('C3'),
    "C4" => Cell.new('C4'),
    "D1" => Cell.new('D1'),
    "D2" => Cell.new('D2'),
    "D3" => Cell.new('D3'),
    "D4" => Cell.new('D4')}
  end

  def create_cells
    cell_letters = ['A', 'B', 'C', 'D']
    cell_numbers = ['1', '2', '3', '4']

    cell_hash = cell_letters.each do |letter|
      cell_numbers.each do |number|
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
      end
    end
    cell_hash
  end

  def valid_coordinate?(coordinate_check)
    ## The '.any?' method returns true if at least 1 of the collection elements is equal to whatever you put in as the argument
    @cells.keys.any? do |key|
      key == coordinate_check
    end
  end

end
