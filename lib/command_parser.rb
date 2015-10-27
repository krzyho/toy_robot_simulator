class CommandParser
  PLACE_COMMAND_PATTERN = /PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)/

  class << self
    def parse_command(command_string)
      command = command_string.strip
      case command
      when 'MOVE'
        return MoveCommand.new
      when 'LEFT'
        return LeftCommand.new
      when 'RIGHT'
        return RightCommand.new
      when 'REPORT'
        return ReportCommand.new
      end
      if matched_string = command.match(PLACE_COMMAND_PATTERN)
        return PlaceCommand.new(*matched_string[1..3])
      end
      IgnoreCommand.new
    end
  end
end
