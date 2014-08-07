require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullRate do
    let(:null_rate) { NullRate.new }

    specify { expect(null_rate).to be_nil }
    specify { expect(null_rate.mm_per_hour).to be_nil }
    specify { expect(null_rate.in_per_hour).to be_nil }
    specify { expect(null_rate.metric).to be_nil }
    specify { expect(null_rate.imperial).to be_nil }
    specify { expect(null_rate.units).to be_empty }
    specify { expect(null_rate.to_i).to be_nil }
    specify { expect(null_rate.to_f).to be_nil }
    specify { expect(null_rate.to_s).to be_empty }

    it 'is equal to other null rates' do
      expect(null_rate == NullRate.new).to be true
    end
  end
end
