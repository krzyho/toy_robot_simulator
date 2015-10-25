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

  describe "#left" do
    before { robot.direction = 1 }

    subject { robot.left }

    it "will rotate robot in the left direction" do
      expect { subject }.to change { robot.direction }.from(1).to(4)
    end
  end

  describe "#right" do
    before { robot.direction = 1 }

    subject { robot.right }

    it "will rotate robot in the right direction" do
      expect { subject }.to change { robot.direction }.from(1).to(2)
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