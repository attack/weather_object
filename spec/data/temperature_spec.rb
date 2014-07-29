require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe Temperature do
    describe '.initialize' do
      it 'sets C' do
        temperature = Temperature.new(20.0, nil)
        expect( temperature.c ).to eq 20.0
      end

      it 'sets F' do
        temperature = Temperature.new(nil, 68.0)
        expect( temperature.f ).to eq 68.0
      end

      it 'defaults to metric' do
        temperature = Temperature.new(20)
        expect( temperature ).to be_metric
      end
    end

    describe '.[]' do
      it 'converts a number to a temperature' do
        temperature = Temperature[10]
        expect(temperature).to be_a Temperature
        expect(temperature.to_s).to eq '10 C'
      end

      it 'leaves a temperature as a temperature' do
        temperature = Temperature.new(10)
        expect(Temperature[temperature]).to eq temperature
      end
    end

    describe '#f' do
      it 'returns known value as F' do
        temperature = Temperature.new(:imperial, 68)
        expect( temperature.f ).to eq 68
      end
    end

    describe '#c' do
      it 'returns known value as C' do
        temperature = Temperature.new(:metric, 20)
        expect( temperature.c ).to eq 20
      end
    end

    describe '#units' do
      context 'when temperature is metric' do
        it 'returns C' do
          temperature = Temperature.new(:metric, 20.0)
          expect( temperature.units ).to eq 'C'
        end
      end

      context 'when temperature is imperial' do
        it 'returns F' do
          temperature = Temperature.new(:imperial, 68.0)
          expect( temperature.units ).to eq 'F'
        end
      end
    end
  end
end
