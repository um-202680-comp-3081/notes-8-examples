# spec/thermostat_spec.rb
require 'thermostat'

RSpec.describe Thermostat do
  let(:thermostat) { Thermostat.new }

  describe '.new' do
    it 'starts at 68 when no target is given' do
      expect(thermostat.target).to eq(68)
    end

    it 'starts at the target it is given' do
      expect(Thermostat.new(72).target).to eq(72)
    end

    it 'rejects a starting target outside 50 to 90' do
      expect { Thermostat.new(95) }.to raise_error(ArgumentError, 'Target must be from 50 to 90')
    end
  end

  describe '#set' do
    context 'with a target inside the range' do
      it 'changes the target' do
        expect { thermostat.set(72) }.to change { thermostat.target }.from(68).to(72)
      end
    end

    context 'with a target at a limit' do
      it 'accepts 50' do
        thermostat.set(50)
        expect(thermostat.target).to eq(50)
      end

      it 'accepts 90' do
        thermostat.set(90)
        expect(thermostat.target).to eq(90)
      end
    end

    context 'with a target just outside a limit' do
      it 'rejects 49' do
        expect { thermostat.set(49) }.to raise_error(ArgumentError, 'Target must be from 50 to 90')
      end

      it 'rejects 91' do
        expect { thermostat.set(91) }.to raise_error(ArgumentError, 'Target must be from 50 to 90')
      end
    end
  end

  describe '#warmer' do
    it 'moves the target up by the amount given' do
      expect { thermostat.warmer(2) }.to change { thermostat.target }.by(2)
    end

    context 'when the target is near the top of the range' do
      before { thermostat.set(89) }

      it 'rejects going past 90' do
        expect { thermostat.warmer(2) }.to raise_error(ArgumentError, 'Target must be from 50 to 90')
      end
    end
  end

  describe '#mode' do
    let(:thermostat) { Thermostat.new(70) }

    context 'when the room is colder than the target' do
      it 'heats' do
        expect(thermostat.mode(65)).to eq('heat')
      end
    end

    context 'when the room is warmer than the target' do
      it 'cools' do
        expect(thermostat.mode(75)).to eq('cool')
      end
    end

    context 'when the room is exactly at the target' do
      it 'turns off' do
        expect(thermostat.mode(70)).to eq('off')
      end
    end
  end

  describe '#report' do
    it 'prints the target' do
      expect { thermostat.report }.to output("Target: 68 degrees\n").to_stdout
    end
  end
end
