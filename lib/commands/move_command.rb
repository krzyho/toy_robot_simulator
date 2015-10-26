class MoveCommand
  def valid?(robot, board)
    board.move_valid?(*robot.coordinates)
  end
end
