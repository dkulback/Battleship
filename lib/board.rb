class Board
  attr_reader :cells

  def initialize
    @cells = {}
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
end
