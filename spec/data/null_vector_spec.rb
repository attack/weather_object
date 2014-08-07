require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullVector do
    let(:null_vector) { NullVector.new }

    specify { expect(null_vector).to be_nil }
    specify { expect(null_vector.kph).to be_nil }
    specify { expect(null_vector.mph).to be_nil }
    specify { expect(null_vector.bearing).to be_nil }
    specify { expect(null_vector.metric).to be_nil }
    specify { expect(null_vector.imperial).to be_nil }
    specify { expect(null_vector.units).to be_empty }
    specify { expect(null_vector.to_i).to be_nil }
    specify { expect(null_vector.to_f).to be_nil }
    specify { expect(null_vector.to_s).to be_empty }

    it 'is equal to other null vectors' do
      expect(null_vector == NullVector.new).to be true
    end
  end
end
