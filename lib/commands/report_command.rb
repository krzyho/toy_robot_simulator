class ReportCommand
  def valid?(robot, _)
    robot.placed?
  end

  def execute(robot)
    robot.report
  end
end
