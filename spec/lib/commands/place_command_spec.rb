require 'spec_helper'

describe PlaceCommand do
  let(:command) { PlaceCommand.new('1', '2', 'NORTH') }
  let(:robot) { double }
  let(:board) { double }

  describe '#valid?' do
    subject { command.valid?(robot, board) }

    it 'returns true' do
      expect(subject).to be_truthy
    end

    context "when PLACE parameters are out of range" do
      let(:command) { PlaceCommand.new('10', '2', 'NORTH') }

      it 'returns false' do
        expect(subject).to be_falsy
      end
    end
  end
end
