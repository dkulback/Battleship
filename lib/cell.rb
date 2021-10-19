class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @ship_hurt = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_instance)
    @ship = ship_instance
  end

  def fired_upon?
    @ship_hurt
  end

  def fire_upon
    if @ship != nil && fired_upon? == false
      @ship.hit
    end
    @ship_hurt = true
  end
end
