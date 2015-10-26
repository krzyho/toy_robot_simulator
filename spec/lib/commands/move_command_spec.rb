require 'spec_helper'

describe MoveCommand do
  let(:command) { MoveCommand.new }
  let(:robot) { double(coordinates: [1, 2, 3]) }
  let(:board) { double }
  let(:valid_move) { true }

  describe '#valid?' do
    before do
      expect(board).to receive(:move_valid?).with(*[1, 2, 3])
        .and_return(valid_move)
    end

    subject { command.valid?(robot, board) }

    it 'returns true' do
      expect(subject).to be_truthy
    end

    context 'when board informs that move is invalid' do
      let(:valid_move) { false }

      it 'returns false' do
        expect(subject).to be_falsy
      end
    end
  end
end
