require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe Ozone do
    describe '#initialize' do
      it 'sets du' do
        ozone = Ozone.new(3)
        expect(ozone.du).to eq 3.0
      end
    end

    describe '#du' do
      it 'returns known value as du' do
        ozone = Ozone.new(2)
        expect(ozone.du).to eq 2.0
      end
    end

    describe '#units' do
      it 'returns the units' do
        ozone = Ozone.new(3)
        expect(ozone.units).to eq 'DU'
      end
    end

    describe '#to_s' do
      it 'displays with units' do
        ozone = Ozone.new(2.5)
        expect(ozone.to_s).to eq '2.5 DU'
      end
    end
  end
end
