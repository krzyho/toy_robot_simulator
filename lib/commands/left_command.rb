class LeftCommand
  def valid?(_, _)
    true
  end

  def execute(robot)
    robot.left
  end
end
