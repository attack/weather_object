require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullOzone do
    let(:null_ozone) { NullOzone.new }

    specify { expect(null_ozone).to be_nil }
    specify { expect(null_ozone.du).to be_nil }
    specify { expect(null_ozone.units).to be_empty }
    specify { expect(null_ozone.to_i).to be_nil }
    specify { expect(null_ozone.to_f).to be_nil }
    specify { expect(null_ozone.to_s).to be_empty }

    it 'is equal to other null ozones' do
      expect(null_ozone == NullOzone.new).to be true
    end
  end
end
