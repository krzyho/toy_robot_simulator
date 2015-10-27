class PlaceCommand
  def initialize(x, y, direction)
    @x = x.to_i
    @y = y.to_i
    @direction = direction
  end

  def valid?(_, board)
    (0...board.x_size).include?(@x) && (0...board.y_size).include?(@y)
  end

  def execute(robot)
    robot.place(@x, @y, @direction)
  end
end
