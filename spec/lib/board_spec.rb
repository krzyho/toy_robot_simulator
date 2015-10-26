require 'spec_helper'

def direction_string(direction)
  case direction
  when 1
    'NORTH'
  when 2
    'EAST'
  when 3
    'SOUTH'
  when 4
    'WEST'
  end
end

describe Board do
  let(:board) { Board.new(5, 5) }

  shared_examples_for 'move is valid' do |direction|
    let(:direction) { direction }

    subject { board.move_valid?(x_pos, y_pos, direction) }

    it "in the #{direction_string(direction)} direction" do
      expect(subject).to be_truthy
    end
  end

  shared_examples_for 'move is not valid' do |direction|
    let(:direction) { direction }

    subject { board.move_valid?(x_pos, y_pos, direction) }

    it "in the #{direction_string(direction)} direction" do
      expect(subject).to be_falsy
    end
  end

  describe '#move_valid?' do
    context 'north east corner' do
      let(:x_pos) { 4 }
      let(:y_pos) { 4 }

      it_behaves_like 'move is not valid', 1 # NORTH
      it_behaves_like 'move is not valid', 2 # EAST
      it_behaves_like 'move is valid', 3     # SOUTH
      it_behaves_like 'move is valid', 4     # WEST
    end

    context 'south east corner' do
      let(:x_pos) { 4 }
      let(:y_pos) { 0 }

      it_behaves_like 'move is valid', 1     # NORTH
      it_behaves_like 'move is not valid', 2 # EAST
      it_behaves_like 'move is not valid', 3 # SOUTH
      it_behaves_like 'move is valid', 4     # WEST
    end

    context 'south west corner' do
      let(:x_pos) { 0 }
      let(:y_pos) { 0 }

      it_behaves_like 'move is valid', 1     # NORTH
      it_behaves_like 'move is valid', 2     # EAST
      it_behaves_like 'move is not valid', 3 # SOUTH
      it_behaves_like 'move is not valid', 4 # WEST
    end

    context 'north west corner' do
      let(:x_pos) { 0 }
      let(:y_pos) { 4 }

      it_behaves_like 'move is not valid', 1 # NORTH
      it_behaves_like 'move is valid', 2     # EAST
      it_behaves_like 'move is valid', 3     # SOUTH
      it_behaves_like 'move is not valid', 4 # WEST
    end

    context 'somewhere in the middle' do
      let(:x_pos) { 2 }
      let(:y_pos) { 2 }

      it_behaves_like 'move is valid', 1     # NORTH
      it_behaves_like 'move is valid', 2     # EAST
      it_behaves_like 'move is valid', 3     # SOUTH
      it_behaves_like 'move is valid', 4     # WEST
    end
  end
end
