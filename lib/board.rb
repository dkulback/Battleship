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

  def horizontal_check(already_char_array)
    if already_char_array.length == 2
      (already_char_array[1][1]).to_i == (already_char_array[0][1]).to_i + 1
    elsif already_char_array.length == 3
      (already_char_array[1][1]).to_i == ((already_char_array[0][1]).to_i + 1) && (already_char_array[2][1]).to_i == ((already_char_array[1][1]).to_i + 1)
    end
  end

  def vertical_check(already_char_array)
    if already_char_array.length == 2
      (already_char_array[1][0]).ord == (already_char_array[0][0]).ord + 1
    elsif already_char_array.length == 3
      (already_char_array[1][0]).ord == ((already_char_array[0][0]).ord + 1) && (already_char_array[2][0]).ord == ((already_char_array[1][0]).ord + 1)
    end
  end

  def valid_placement?(ship, placement)
    placement_chared = split_array(placement)
    (ship.length == placement.length) && (horizontal_check(placement_chared) || vertical_check(placement_chared)) && (placement.all? { |coordinate| @cells[coordinate].ship == nil})

    # array_of_coordinates_split = split_array(placement)
    # array_of_coordinates_split
  end

  def place(ship, position)
    @cells.keys.select do |key|
      position.each do |pos|
        if pos == key
          @cells[key].place_ship(ship)
        end
      end
    end








    # if @cells["A1"].coordinate == position[0]
    #   @cells["A1"].place_ship(ship)
    # end

  end



end
