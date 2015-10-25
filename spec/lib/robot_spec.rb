require 'spec_helper'

describe Robot do
  let(:robot) { Robot.new }

  describe "#place" do
    let(:x_pos) { 1 }
    let(:y_pos) { 2 }
    let(:direction) { 1 }

    before { subject }
    subject { robot.place(x_pos, y_pos, direction) }

    it "sets correct attributes" do
      expect(robot.x).to eq(x_pos)
      expect(robot.y).to eq(y_pos)
      expect(robot.direction).to eq(direction)
    end
  end

  describe "#move" do
    let(:direction) { 1 }

    before do
      robot.x = 2
      robot.y = 2
      robot.direction = direction
    end

    shared_examples_for "moves robot" do |dir, x_pos, y_pos|
      before { robot.move }

      it "in the #{dir} direction" do
        expect(robot.x).to eq(x_pos)
        expect(robot.y).to eq(y_pos)
        expect(robot.direction).to eq(direction)
      end
    end

    it_behaves_like "moves robot", 'north', 2, 3

    context "facing east" do
      let(:direction) { 2 }
      it_behaves_like "moves robot", 'east', 3, 2
    end

    context "facing south" do
      let(:direction) { 3 }
      it_behaves_like "moves robot", 'south', 2, 1
    end

    context "facing west" do
      let(:direction) { 4 }
      it_behaves_like "moves robot", 'west', 1, 2
    end
  end

  shared_examples_for "rotates robot" do |dir, from, to|
    subject { robot.send(dir) }

    it "in the #{dir} direction" do
      expect { subject }.to change { robot.direction }.from(from).to(to)
    end
  end

  describe "#left" do
    let(:direction) { 1 }
    before { robot.direction = direction }

    it_behaves_like "rotates robot", 'left', 1, 4

    context "facing east" do
      let(:direction) { 2 }

      it_behaves_like "rotates robot", 'left', 2, 1
    end

    context "facing south" do
      let(:direction) { 3 }

      it_behaves_like "rotates robot", 'left', 3, 2
    end

    context "facing west" do
      let(:direction) { 4 }

      it_behaves_like "rotates robot", 'left', 4, 3
    end
  end

  describe "#right" do
    let(:direction) { 1 }
    before { robot.direction = direction }

    it_behaves_like "rotates robot", 'right', 1, 2

    context "facing east" do
      let(:direction) { 2 }

      it_behaves_like "rotates robot", 'right', 2, 3
    end

    context "facing south" do
      let(:direction) { 3 }

      it_behaves_like "rotates robot", 'right', 3, 4
    end

    context "facing west" do
      let(:direction) { 4 }

      it_behaves_like "rotates robot", 'right', 4, 1
    end
  end

  describe "#report" do
    let(:x_pos) { 1 }
    let(:y_pos) { 2 }
    let(:direction) { 1 }

    before do
      allow(robot).to receive(:x).and_return(x_pos)
      allow(robot).to receive(:y).and_return(y_pos)
      allow(robot).to receive(:direction).and_return(direction)
    end

    subject { robot.report }

    it "returns position and facing of the robot" do
      expect(subject).to eq("[#{x_pos},#{y_pos}] NORTH")
    end
  end

  describe "#direction_to_s" do
    let(:direction) { 1 }
    before { robot.direction = direction }

    subject { robot.direction_to_s }
    it { expect(subject).to eq('NORTH') }

    context "when direction is east" do
      let(:direction) { 2 }
      it { expect(subject).to eq('EAST') }
    end

    context "when direction is south" do
      let(:direction) { 3 }
      it { expect(subject).to eq('SOUTH') }
    end

    context "when direction is west" do
      let(:direction) { 4 }
      it { expect(subject).to eq('WEST') }
    end
  end
end