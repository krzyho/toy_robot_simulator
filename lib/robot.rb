class Robot
  attr_accessor :x, :y, :direction

  def place(x, y, direction)
    self.x = x
    self.y = y
    self.direction = direction
  end

  def move
  end

  def left
    self.direction = (self.direction > 1) ? self.direction - 1 : 4
  end

  def right
    self.direction = (self.direction < 4) ? self.direction + 1 : 1
  end

  def report
  end
end