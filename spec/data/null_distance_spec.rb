require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe NullDistance do
    let(:null_distance) { NullDistance.new }

    specify { expect(null_distance).to be_nil }
    specify { expect(null_distance.km).to be_nil }
    specify { expect(null_distance.m).to be_nil }
    specify { expect(null_distance.metric).to be_nil }
    specify { expect(null_distance.imperial).to be_nil }
    specify { expect(null_distance.units).to be_empty }
    specify { expect(null_distance.to_i).to be_nil }
    specify { expect(null_distance.to_f).to be_nil }
    specify { expect(null_distance.to_s).to be_empty }

    it 'is equal to other null distances' do
      expect(null_distance == NullDistance.new).to be true
    end
  end
end
