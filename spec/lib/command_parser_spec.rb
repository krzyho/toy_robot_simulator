require 'spec_helper'

describe CommandParser do
  describe '.parse_command' do
    let(:command_string) { '' }

    subject { CommandParser.parse_command(command_string) }

    it 'returns IgnoreCommand for empty command' do
      expect(subject).to be_an(IgnoreCommand)
    end

    context 'MOVE command with new line at the end' do
      let(:command_string) { "MOVE\n" }

      it 'returns MoveCommand' do
        expect(subject).to be_an(MoveCommand)
      end
    end

    context 'mistyped MOVE command' do
      let(:command_string) { 'MVOE' }

      it 'returns IgnoreCommand' do
        expect(subject).to be_an(IgnoreCommand)
      end
    end

    context 'invalid PLACE command - no y position' do
      let(:command_string) { 'PLACE 1,NORTH' }

      it 'returns IgnoreCommand' do
        expect(subject).to be_an(IgnoreCommand)
      end
    end

    context 'invalid PLACE command - mistyped direction' do
      let(:command_string) { 'PLACE 1,2,NOR' }

      it 'returns IgnoreCommand' do
        expect(subject).to be_an(IgnoreCommand)
      end
    end

    context 'valid PLACE command' do
      let(:command_string) { 'PLACE 1,2,NORTH' }

      it 'returns PlaceCommand' do
        expect(subject).to be_a(PlaceCommand)
      end
    end

    context 'valid MOVE command' do
      let(:command_string) { 'MOVE' }

      it 'returns MoveCommand' do
        expect(subject).to be_a(MoveCommand)
      end
    end

    context 'valid LEFT command' do
      let(:command_string) { 'LEFT' }

      it 'returns LeftCommand' do
        expect(subject).to be_a(LeftCommand)
      end
    end

    context 'valid RIGHT command' do
      let(:command_string) { 'RIGHT' }

      it 'returns RightCommand' do
        expect(subject).to be_a(RightCommand)
      end
    end

    context 'valid REPORT command' do
      let(:command_string) { 'REPORT' }

      it 'returns ReportCommand' do
        expect(subject).to be_a(ReportCommand)
      end
    end
  end
end
