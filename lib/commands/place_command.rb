class PlaceCommand
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def valid?(_, _)
    (0..Board::UNITS).include?(@x.to_i) && (0..Board::UNITS).include?(@y.to_i)
  end
end
