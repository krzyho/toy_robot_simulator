class CommandParser
  class << self
    def parse_command(command_string)
      case command_string
      when 'MOVE'
        return MoveCommand.new
      when 'LEFT'
        return LeftCommand.new
      when 'RIGHT'
        return RightCommand.new
      when 'REPORT'
        return ReportCommand.new
      end
      if matched_string = command_string.match(/PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)/)
        return PlaceCommand.new(*matched_string[1..3])
      end
      return IgnoreCommand.new
    end
  end
end