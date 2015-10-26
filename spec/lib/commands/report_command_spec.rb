require 'spec_helper'

describe ReportCommand do
  let(:command) { ReportCommand.new }
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

    it 'robot reports' do
      expect(robot).to receive(:report)
      subject
    end
  end
end
