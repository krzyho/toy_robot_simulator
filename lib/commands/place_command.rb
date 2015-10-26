class PlaceCommand
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def valid?(_, board)
    (0..board.x_size).include?(@x.to_i) && (0..board.y_size).include?(@y.to_i)
  end
end
