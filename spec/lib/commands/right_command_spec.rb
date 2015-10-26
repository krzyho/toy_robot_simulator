require 'spec_helper'

describe RightCommand do
  let(:command) { RightCommand.new }
  let(:robot) { double }
  let(:board) { double }

  describe '#valid?' do
    subject { command.valid?(robot, board) }

    it 'always returns true' do
      expect(subject).to be_truthy
    end
  end

  describe '#execute' do
    subject { command.execute(robot) }

    it 'robot turns right' do
      expect(robot).to receive(:right)
      subject
    end
  end
end
