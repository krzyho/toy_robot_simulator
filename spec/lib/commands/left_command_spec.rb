require 'spec_helper'

describe LeftCommand do
  let(:command) { LeftCommand.new }
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

    context "when robot is not placed" do
      let(:robot_placed) { false }

      it 'returns false' do
        expect(subject).to be_falsy
      end
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
