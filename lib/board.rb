require 'pry'
class Board
  attr_reader :cells

  def initialize
    @cells = {
    "A1" => Cell.new('A1'),
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
    "D4" => Cell.new('D4')
  }
  end



  def valid_coordinate?(coordinate_check)
    ## The '.any?' method returns true if at least 1 of the collection elements is equal to whatever you put in as the argument
    @cells.keys.any? do |key|
      key == coordinate_check
    end
  end

  def split_array(ship_array)
    ship_array.map do |each_coordinate|
      each_coordinate.chars
    end
  end

  def horizontal_check(placement_char_array)
    if placement_char_array.length == 2
      (placement_char_array[1][1]).to_i == (placement_char_array[0][1]).to_i + 1
    elsif placement_char_array.length == 3
      (placement_char_array[1][1]).to_i == ((placement_char_array[0][1]).to_i + 1) && (placement_char_array[2][1]).to_i == ((placement_char_array[1][1]).to_i + 1)
    end
  end

  def vertical_check(placement_char_array)
    if placement_char_array.length == 2
      (placement_char_array[1][0]).ord == (placement_char_array[0][0]).ord + 1
    elsif placement_char_array.length == 3
      (placement_char_array[1][0]).ord == ((placement_char_array[0][0]).ord + 1) && (placement_char_array[2][0]).ord == ((placement_char_array[1][0]).ord + 1)
    end
  end

  def valid_placement?(ship, placement)
    placement_chared = split_array(placement)

    (ship.length == placement.length) && (horizontal_check(placement_chared) || vertical_check(placement_chared)) && ((horizontal_check(placement_chared) || vertical_check(placement_chared)) == false) && (placement.all? {|coordinate| @cells[coordinate].empty?})
  end

  def place(ship, position)
    @cells.keys.select do |key|
      position.each do |pos|
        if pos == key
          @cells[key].place_ship(ship)
        end
      end
    end
  end

  def fire(coord)
    @cells.keys.select do |key|
      if key == coord && @cells[key].fired_upon? == false
        @cells[key].fire_upon
      end
    end
  end

    def render(ship = false)
    "  1 2 3 4 \nA #{@cells["A1"].render(ship)} #{@cells["A2"].render(ship)} #{@cells["A3"].render(ship)} #{@cells["A4"].render(ship)} \nB #{@cells["B1"].render(ship)} #{@cells["B2"].render(ship)} #{@cells["B3"].render(ship)} #{@cells["B4"].render(ship)} \nC #{@cells["C1"].render(ship)} #{@cells["C2"].render(ship)} #{@cells["C3"].render(ship)} #{@cells["C4"].render(ship)} \nD #{@cells["D1"].render(ship)} #{@cells["D2"].render(ship)} #{@cells["D3"].render(ship)} #{@cells["D4"].render(ship)} \n"
  end
end
