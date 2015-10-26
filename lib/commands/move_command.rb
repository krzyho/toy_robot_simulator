class MoveCommand
  def valid?(robot, board)
    board.move_valid?(*robot.coordinates)
  end

  def execute(robot)
    robot.move
  end
end
