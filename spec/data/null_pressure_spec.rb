require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullPressure do
    let(:null_pressure) { NullPressure.new }

    specify { expect(null_pressure).to be_nil }
    specify { expect(null_pressure.mb).to be_nil }
    specify { expect(null_pressure.in).to be_nil }
    specify { expect(null_pressure.metric).to be_nil }
    specify { expect(null_pressure.imperial).to be_nil }
    specify { expect(null_pressure.units).to be_empty }
    specify { expect(null_pressure.to_i).to be_nil }
    specify { expect(null_pressure.to_f).to be_nil }
    specify { expect(null_pressure.to_s).to be_empty }

    it 'is equal to other null pressures' do
      expect(null_pressure == NullPressure.new).to be true
    end
  end
end
