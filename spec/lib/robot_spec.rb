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
end