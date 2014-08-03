require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe Rate do
    describe '.initialize' do
      it 'sets mm/hr' do
        rate = Rate.new(3.0, nil)
        expect(rate.mm_per_hour).to eq 3.0
      end

      it 'sets in/hr' do
        rate = Rate.new(nil, 0.12)
        expect(rate.in_per_hour).to eq 0.12
      end

      it 'defaults to metric' do
        rate = Rate.new(3)
        expect(rate).to be_metric
      end

      it 'converts to metric' do
        rate = Rate.new(:imperial, 0.12)
        expect(rate.mm_per_hour).to eq 3.048
      end

      it 'converts to imperial' do
        rate = Rate.new(:metric, 3)
        expect(rate.in_per_hour).to eq 0.118
      end
    end

    describe '#in_per_hour' do
      it 'returns known value as in/hr' do
        rate = Rate.new(:imperial, 0.12)
        expect(rate.in_per_hour).to eq 0.12
      end
    end

    describe '#mm_per_hour' do
      it 'returns known value as mm/hr' do
        rate = Rate.new(:metric, 3)
        expect(rate.mm_per_hour).to eq 3
      end
    end

    describe '#units' do
      context 'when rate is metric' do
        it 'returns mm/hr' do
          rate = Rate.new(:metric, 3.0)
          expect(rate.units).to eq 'mm/hr'
        end
      end

      context 'when rate is imperial' do
        it 'returns in/hr' do
          rate = Rate.new(:imperial, 0.12)
          expect(rate.units).to eq 'in/hr'
        end
      end
    end
  end
end
