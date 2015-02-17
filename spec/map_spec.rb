require 'rspec'
require 'pry'
require 'map'
require 'cell'

describe "Map" do
  let(:cells) do
    cells = []
    10.times do |row|
      10.times do |col|
        cells << Cell.new({row: row, col: col})
      end
    end
    cells
  end

  let(:map){ Map.new }

  before do
    cells.each do |cell|
      map.add_cell(cell)
    end
  end

  it "has a height" do
    expect(map.height).to eq 10
  end

  it "has a width" do
    expect(map.width).to eq 10
  end

  it "knows current status for any x and y" do
    coordinate_status = map.current_status_for([0,0])
    expect(coordinate_status).to eq 0
  end

  it 'shows a demo of our product to the investors' do
    count = 0
    map.current_state.each do |cell|
      if count == 5
        puts([0, 1].sample)
        count = 0
      else
        print([0, 1].sample)
      sleep 0.25
      count += 1
    end
  end
end


end
