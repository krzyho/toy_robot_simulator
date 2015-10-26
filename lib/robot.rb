class Robot
  DIRECTIONS = %w(NORTH EAST SOUTH WEST)
  attr_accessor :x, :y, :direction

  def place(x, y, direction)
    self.x = x
    self.y = y
    self.direction = DIRECTIONS.index(direction) + 1
  end

  def move
    value = self.direction < 3 ? 1 : -1
    axis = self.direction % 2 == 0 ? 'x' : 'y'
    instance_variable_set(:"@#{axis}", self.send(axis) + value)
  end

  def left
    self.direction = (self.direction > 1) ? self.direction - 1 : 4
  end

  def right
    self.direction = (self.direction < 4) ? self.direction + 1 : 1
  end

  def report
    puts "[#{x},#{y}] #{direction_to_s}"
  end

  def direction_to_s
    DIRECTIONS[self.direction - 1]
  end
end
