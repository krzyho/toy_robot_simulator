require "toy_robot_simulator/version"
require "robot"
require "board"
require "command_parser"
Dir['./lib/commands/*.rb'].each { |file| require file }

module ToyRobotSimulator
  class Simulator

    def initialize
      @robot = Robot.new
      @board = Board.new(5, 5)
    end

    def start_simulator
      begin
        loop do
          command = CommandParser.parse_command(STDIN.gets)
          command.execute(@robot) if command.valid?(@robot, @board)
        end
      rescue SystemExit, Interrupt => e
        # rescue from CTRL-C
        exit
      end
    end
  end
end
