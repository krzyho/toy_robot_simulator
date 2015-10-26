class ReportCommand
  def valid?(_, _)
    true
  end

  def execute(robot)
    robot.report
  end
end
