require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullTemperature do
    let(:null_temperature) { NullTemperature.new }

    specify { expect(null_temperature).to be_nil }
    specify { expect(null_temperature.c).to be_nil }
    specify { expect(null_temperature.f).to be_nil }
    specify { expect(null_temperature.metric).to be_nil }
    specify { expect(null_temperature.imperial).to be_nil }
    specify { expect(null_temperature.units).to be_empty }
    specify { expect(null_temperature.to_i).to be_nil }
    specify { expect(null_temperature.to_f).to be_nil }
    specify { expect(null_temperature.to_s).to be_empty }

    it 'is equal to other null temperatures' do
      expect(null_temperature == NullTemperature.new).to be true
    end
  end
end
