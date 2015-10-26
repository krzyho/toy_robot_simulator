require 'spec_helper'

describe LeftCommand do
  let(:command) { LeftCommand.new }
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

    it 'robot turns left' do
      expect(robot).to receive(:left)
      subject
    end
  end
end
