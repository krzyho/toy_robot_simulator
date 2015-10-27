require 'spec_helper'

describe ExitCommand do
  let(:command) { ExitCommand.new }
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

    it 'exits application' do
      expect(command).to receive(:exit)
      subject
    end
  end
end
