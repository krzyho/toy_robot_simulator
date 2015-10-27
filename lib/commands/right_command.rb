class RightCommand
  def valid?(robot, _)
    robot.placed?
  end

  def execute(robot)
    robot.right
  end
end
