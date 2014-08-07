require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullZone do
    let(:null_zone) { NullZone.new }

    specify { expect(null_zone).to be_nil }
    specify { expect(null_zone.code).to be_empty }
    specify { expect(null_zone.offset).to be_nil }
    specify { expect(null_zone.now).to be_nil }
    specify { expect(null_zone.to_s).to be_empty }

    it 'is equal to other null zones' do
      expect(null_zone == NullZone.new).to be true
    end
  end
end
