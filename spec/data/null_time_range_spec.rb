require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullTimeRange do
    let(:null_time_range) { NullTimeRange.new }

    specify { expect(null_time_range).to be_nil }
    specify { expect(null_time_range.starts_at).to be_nil }
    specify { expect(null_time_range.ends_at).to be_nil }
    specify { expect(null_time_range.size).to be_zero }
    specify { expect(null_time_range.covers?(nil)).to be false }
    specify { expect(null_time_range.to_s).to be_empty }

    it 'is equal to other null time ranges' do
      expect(null_time_range == NullTimeRange.new).to be true
    end
  end
end
