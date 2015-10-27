class MoveCommand
  def valid?(robot, board)
    robot.placed? && board.move_valid?(*robot.coordinates)
  end

  def execute(robot)
    robot.move
  end
end
