require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
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
    require "pry"; binding.pry
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq(false)
  end

  it '#fired_upon' do
    
    expect(@cell.fired_upon).to eq(false)
  end






end
