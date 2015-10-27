class Board
  attr_accessor :x_size, :y_size

  def initialize(x_size, y_size)
    self.x_size = x_size
    self.y_size = y_size
  end

  def move_valid?(x, y, direction)
    axis = direction % 2 == 0 ? 'x' : 'y'
    direction < 3 ? eval(axis) < eval("#{axis}_size") - 1 : eval(axis) > 0
  end

end
