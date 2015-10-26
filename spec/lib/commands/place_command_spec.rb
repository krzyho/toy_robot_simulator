require 'spec_helper'

describe PlaceCommand do
  let(:command) { PlaceCommand.new('1', '2', 'NORTH') }
  let(:robot) { double }
  let(:board) { double(x_size: 5, y_size: 5) }

  describe '#valid?' do
    subject { command.valid?(robot, board) }

    it 'returns true' do
      expect(subject).to be_truthy
    end

    context 'when PLACE x parameter is out of range' do
      let(:command) { PlaceCommand.new('10', '2', 'NORTH') }

      it 'returns false' do
        expect(subject).to be_falsy
      end
    end

    context 'when PLACE y parameter is out of range' do
      let(:command) { PlaceCommand.new('1', '20', 'NORTH') }

      it 'returns false' do
        expect(subject).to be_falsy
      end
    end
  end

  describe '#execute' do
    subject { command.execute(robot) }

    it 'robot places' do
      expect(robot).to receive(:place).with(1, 2, 'NORTH')
      subject
    end
  end
end
