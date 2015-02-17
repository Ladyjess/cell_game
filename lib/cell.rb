class Cell
  attr_reader :current_state
  attr_reader :x
  attr_reader :y
  attr_reader :neighbor_alive_count

  def initialize(parameters = {})
    @current_state = parameters[:current_state] ||= 0
    @x = parameters[:x]
    @y = parameters[:y]
    @neighbor_alive_count = parameters[:neighbor_alive_count] ||= 0
  end

  def increment_neighbor_alive_count
    @neighbor_alive_count += 1
  end

  def reset
    @neighbor_alive_count = 0
  end

  def neighbor_coordinates
    coordinates_out = []
    row = 1
    switch_row = false
    switch_col = false

    6.times do
      col = 1
      if (switch_row)
        row -= 1
        switch_row = false
      else
        switch_row = true
      end
      6.times do
        coordinates_out.push([row + @x, col + @y])
        if (switch_col)
          col -= 1
          switch_col = false
        else
          switch_col = true
        end
      end
    end
    return coordinates_out.uniq
  end

  def to_s
    @current_state
  end
end
