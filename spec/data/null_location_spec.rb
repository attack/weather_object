require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullLocation do
    let(:null_location) { NullLocation.new }

    specify { expect(null_location).to be_nil }
    specify { expect(null_location.id).to be_empty }
    specify { expect(null_location.latitude).to be_nil }
    specify { expect(null_location.longitude).to be_nil }
    specify { expect(null_location.coordinates).to be_empty }
    specify { expect(null_location.name).to be_empty }
    specify { expect(null_location.city).to be_empty }
    specify { expect(null_location.state_name).to be_empty }
    specify { expect(null_location.country).to be_empty }
    specify { expect(null_location.country_code).to be_empty }
    specify { expect(null_location.zip_code).to be_empty }
    specify { expect(null_location.to_s).to be_empty }

    it 'is equal to other null locations' do
      expect(null_location == NullLocation.new).to be true
    end
  end
end
