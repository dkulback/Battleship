require './lib/ship'

RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exsists' do
    expect(@cruiser).to be_an_instance_of(Ship)
  end

  it 'has attrubutes' do
    expect(@cruiser.name).to eq('Cruiser')
    expect(@cruiser.length).to eq(3)
  end

  it '#health' do
    expect(@cruiser.health).to eq(3)
  end

  it '#hit' do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
  end

  it '#sunk?' do
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(false)
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
  end
end
