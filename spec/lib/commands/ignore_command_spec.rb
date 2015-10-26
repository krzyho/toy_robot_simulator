require 'spec_helper'

describe IgnoreCommand do
  let(:command) { IgnoreCommand.new }
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

    it 'does not raise error' do
      expect { subject }.not_to raise_error
    end
  end
end
