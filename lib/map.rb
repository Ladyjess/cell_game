class Map
  attr_reader(:cells)
  def initialize
    @cells = [[],[]]
  end

  def current_status_for(coordinates)
    0
  end

  def add_cell cell
    @cells << cell
  end

  def width
    10
  end

  def height
    10
  end

  def current_state
    return @cells
  end
end
