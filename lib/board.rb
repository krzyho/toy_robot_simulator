class Board
  UNITS = 5

  def move_valid?(x, y, direction)
    if direction % 2 == 0
      if direction < 3 
        x < UNITS - 1
      else
        x > 1
      end
    else
      if direction < 3 
        y < UNITS - 1
      else
        y > 1
      end
    end
  end
end