require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe TemperatureRange do
    let(:low) { Temperature.new(5) }
    let(:mid) { Temperature.new(8) }
    let(:high) { Temperature.new(10) }

    describe '#low' do
      context 'when given one value' do
        it 'sets the low' do
          temperature_range = TemperatureRange.new(mid)
          expect(temperature_range.low).to eq mid
        end
      end

      context 'when given two values' do
        it 'sets the low' do
          temperature_range = TemperatureRange.new(low, high)
          expect(temperature_range.low).to eq low
        end

        it 'sets the low' do
          temperature_range = TemperatureRange.new(nil, high)
          expect(temperature_range.low).to eq high
        end
      end

      context 'when given > two values' do
        it 'sets the low' do
          temperature_range = TemperatureRange.new(low, high, 20)
          expect(temperature_range.low).to eq low
        end

        it 'sets the low' do
          temperature_range = TemperatureRange.new(nil, high, 20)
          expect(temperature_range.low).to eq high
        end
      end
    end

    describe '#high' do
      context 'when given one value' do
        it 'sets the high' do
          temperature_range = TemperatureRange.new(mid)
          expect(temperature_range.high).to eq mid
        end
      end

      context 'when given two values' do
        it 'sets the high' do
          temperature_range = TemperatureRange.new(low, high)
          expect(temperature_range.high).to eq high
        end

        it 'sets the high' do
          temperature_range = TemperatureRange.new(low, nil)
          expect(temperature_range.high).to eq low
        end
      end

      context 'when given > two values' do
        it 'sets the high' do
          temperature_range = TemperatureRange.new(low, high, 20)
          expect(temperature_range.high).to eq high
        end

        it 'sets the high' do
          temperature_range = TemperatureRange.new(low, nil, 20)
          expect(temperature_range.high).to eq low
        end
      end
    end

    describe '#cover?' do
      let(:temperature_range) { TemperatureRange.new(low, high) }

      specify { expect(temperature_range.cover?(low)).to be true }
      specify { expect(temperature_range.cover?(mid)).to be true }
      specify { expect(temperature_range.cover?(high)).to be true }

      specify { expect(temperature_range.cover?(Temperature.new(4))).to be false }
      specify { expect(temperature_range.cover?(Temperature.new(11))).to be false }
    end

    describe '#to_s' do
      context 'when low != high' do
        it 'prints the range' do
          temperature_range = TemperatureRange.new(low, high)
          expect(temperature_range.to_s).to eq '5 C..10 C'
        end
      end

      context 'when low == high' do
        it 'prints a single value' do
          temperature_range = TemperatureRange.new(mid, mid)
          expect(temperature_range.to_s).to eq '8 C'
        end
      end
    end
  end
end
