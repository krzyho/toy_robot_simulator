class RightCommand
  def valid?(_, _)
    true
  end

  def execute(robot)
    robot.right
  end
end
