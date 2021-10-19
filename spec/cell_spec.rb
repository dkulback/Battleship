require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_2 = Cell.new("C3")
  end

  it 'exists' do
    expect(@cell).to be_an_instance_of(Cell)
  end

  it 'has attributes' do
    expect(@cell.coordinate).to eq("B4")
  end

  it 'placement of ship is nil by default' do
    expect(@cell.ship).to eq(nil)
  end

  it '#empty?' do
    expect(@cell.empty?).to eq(true)
  end

  it '#place_ship' do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq(false)
  end

  it '#fired_upon?' do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to eq(false)
  end

  it '#fire_upon' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end

  it '#render' do

    expect(@cell.render).to eq(".")

    @cell.fire_upon
    expect(@cell.render).to eq("M")

    expect(@cell_2.render).to eq(".")
    @cell_2.place_ship(@cruiser)

    expect(@cell_2.render(true)).to eq("S")
  end


end
