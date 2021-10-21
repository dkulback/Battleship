class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  def create_cells(place)
    new_cell = Cell.new(place)
    @cells[new_cell.coordinate] = new_cell
    new_cell
  end
end
