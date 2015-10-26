class Board
  UNITS = 5

  def move_valid?(x, y, direction)
    axis = direction % 2 == 0 ? 'x' : 'y'
    direction < 3 ? eval(axis) < UNITS - 1 : eval(axis) > 1
  end
end