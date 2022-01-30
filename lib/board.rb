require 'pry'
class Board
  attr_reader :cells

  def initialize
    @cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4')
    }
  end

  def valid_coordinate?(coordinate_check)
    ## The '.any?' method returns true if at least 1 of the collection elements is equal to whatever you put in as the argument
    @cells.keys.any? do |key|
      key == coordinate_check
    end
  end

  def get_num(coordinates)
    coordinates.map do |cord|
      cord.chars[1].to_i
    end
  end

  def get_letters(coordinates)
    coordinates.map do |cord|
      cord.chars[0].ord
    end
  end

  def horizontal_check(coordinates)
    cords = get_num(coordinates)
    if cords.size == 2
      cords[0] - cords[1] == -1
    else
      cords[0] - cords[1] == -1 && cords[1] - cords[2] == -1
    end
  end

  def vertical_check(coordinates)
    cords = get_letters(coordinates)
    if cords.size == 2
      cords[0] - cords[1] == -1
    else
      cords[0] - cords[1] == -1 && cords[1] - cords[2] == -1
    end
  end

  def diagonal_check(coordinates)
    horz = get_num(coordinates)
    vert = get_letters(coordinates)
    if coordinates.length == 2
      horz[0] == horz[1] || vert[1] == vert[0]
    else
      horz[0] == horz[1] && horz[1] == horz[2] || vert[0] == vert[1] && vert[1] == vert[2]
    end
  end

  def valid_placement?(ship, placement)
    if @cells.values.any? { |cell| !cell.ship.nil? && placement.include?(cell.coordinate) }
      false
    elsif ship.length == placement.length && diagonal_check(placement)
      vertical_check(placement) || horizontal_check(placement)
    else
      false
    end
  end

  def place(ship, position)
    if valid_placement?(ship, position)
      @cells.keys.select do |key|
        position.each do |pos|
          @cells[key].place_ship(ship) if pos == key
        end
      end
    end
  end

  def fire(coord)
    @cells.keys.select do |key|
      @cells[key].fire_upon if key == coord && @cells[key].fired_upon? == false
    end
  end

  def render(ship = false)
    "  1 2 3 4 \nA #{@cells['A1'].render(ship)} #{@cells['A2'].render(ship)} #{@cells['A3'].render(ship)} #{@cells['A4'].render(ship)} \nB #{@cells['B1'].render(ship)} #{@cells['B2'].render(ship)} #{@cells['B3'].render(ship)} #{@cells['B4'].render(ship)} \nC #{@cells['C1'].render(ship)} #{@cells['C2'].render(ship)} #{@cells['C3'].render(ship)} #{@cells['C4'].render(ship)} \nD #{@cells['D1'].render(ship)} #{@cells['D2'].render(ship)} #{@cells['D3'].render(ship)} #{@cells['D4'].render(ship)} \n"
  end
end
