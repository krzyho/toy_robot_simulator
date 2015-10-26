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
      return PlaceCommand.new if command_string =~ /PLACE \d+,\d+,NORTH|EAST|SOUTH|WEST/
      return IgnoreCommand.new
    end
  end
end