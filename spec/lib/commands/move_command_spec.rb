require 'spec_helper'

describe MoveCommand do
  let(:command) { MoveCommand.new }
  let(:robot) { double(coordinates: [1, 2, 3]) }
  let(:board) { double }
  let(:valid_move) { true }

  describe '#valid?' do
    let(:robot_placed) { true }

    before do
      allow(board).to receive(:move_valid?).with(*[1, 2, 3])
        .and_return(valid_move)
      allow(robot).to receive(:placed?).and_return(robot_placed)
    end

    subject { command.valid?(robot, board) }

    it 'returns true' do
      expect(board).to receive(:move_valid?)
      expect(subject).to be_truthy
    end

    context 'when board informs that move is invalid' do
      let(:valid_move) { false }

      it 'returns false' do
        expect(board).to receive(:move_valid?)
        expect(subject).to be_falsy
      end
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

    it 'robot moves' do
      expect(robot).to receive(:move)
      subject
    end
  end
end
