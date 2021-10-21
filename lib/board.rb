class Board
  attr_reader :cells

  def initialize
    @cells = Hash.new { |h, k, v| h[k] = Cell.new }
  end

  def create_cells
    cell_letters = ['A', 'B', 'C', 'D']
    cell_numbers = ['1', '2', '3', '4']

    cell_hash = cell_letters.each do |letter|
      letter
      cell_numbers.each do |number|
        number
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
      end
    end
    cell_hash
  end
end
