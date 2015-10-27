class Robot
  DIRECTIONS = %w(NORTH EAST SOUTH WEST)
  attr_accessor :x, :y, :direction

  def place(x, y, direction)
    self.x = x
    self.y = y
    self.direction = DIRECTIONS.index(direction) + 1
  end

  def move
    value = direction < 3 ? 1 : -1
    axis = direction.even? ? 'x' : 'y'
    instance_variable_set(:"@#{axis}", send(axis) + value)
  end

  def left
    self.direction = (direction > 1) ? direction - 1 : 4
  end

  def right
    self.direction = (direction < 4) ? direction + 1 : 1
  end

  def report
    puts "#{x},#{y},#{direction_to_s}"
  end

  def direction_to_s
    DIRECTIONS[direction - 1]
  end

  def coordinates
    [x, y, direction]
  end

  def placed?
    x && y && direction
  end
end
