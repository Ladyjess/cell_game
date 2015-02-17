require "rspec"
require "cell"
require "pry"

describe "Unpopulated_Cell" do
  let(:test_cell){ Cell.new() }

  it "should have a current state of 0" do
    expect(test_cell.current_state).to eq 0
  end

  it "should have a neighbor_alive_count of 0" do
    expect(test_cell.neighbor_alive_count).to eq 0
  end
end

describe "Populated_Cell" do
  let(:test_cell){ Cell.new({:current_state => 0, :x => 0, :y => 0}) }
  it "should know it's current state" do
    expect(test_cell.current_state).to eq 0
    expect(test_cell.x).to eq 0
    expect(test_cell.y).to eq 0
  end

  it 'can increment neighbor alive count' do
    test_cell.increment_neighbor_alive_count
    expect(test_cell.neighbor_alive_count).to eq 1
  end

  it 'will reset to 0' do
    test_cell.increment_neighbor_alive_count
    expect(test_cell.neighbor_alive_count).to eq 1
    test_cell.reset
    expect(test_cell.current_state).to eq 0
  end

  describe "neighbor_coordinates" do
    let(:coordinates){ test_cell.neighbor_coordinates }
    it 'return neighbor coordinates in a 2d array' do
      expect(coordinates).to include([0,1])
      expect(coordinates).to include([1,0])
      expect(coordinates).to include([1,1])
      expect(coordinates).to include([-1,1])
      expect(coordinates).to include([1,-1])
      expect(coordinates).to include([0,-1])
      expect(coordinates).to include([-1,0])
      expect(coordinates).to include([-1,-1])
    end
  end


end
