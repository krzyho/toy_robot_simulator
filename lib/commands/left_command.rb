class LeftCommand
  def valid?(robot, _)
    robot.placed?
  end

  def execute(robot)
    robot.left
  end
end
