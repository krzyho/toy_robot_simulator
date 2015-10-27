require 'spec_helper'

describe ReportCommand do
  let(:command) { ReportCommand.new }
  let(:robot) { double }
  let(:board) { double }

  describe '#valid?' do
    let(:robot_placed) { true }

    before do
      allow(robot).to receive(:placed?).and_return(robot_placed)
    end

    subject { command.valid?(robot, board) }

    it 'returns true' do
      expect(subject).to be_truthy
    end

    context 'when robot is not placed' do
      let(:robot_placed) { false }

      it 'returns false' do
        expect(subject).to be_falsy
      end
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
