require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :distance, Attribute::Distance
  end

  RSpec.describe Attribute::Distance do
    context 'when setting to nil' do
      it 'initializes a Data::NullDistance' do
        model = TestClass.new(distance: nil)
        expect(model.distance).to be_a Data::NullDistance
      end

      it 'is nil' do
        model = TestClass.new(distance: nil)
        expect(model.distance).to be_nil
      end
    end

    context 'when setting to a single value' do
      it 'initializes a Data::Distance' do
        model = TestClass.new(distance: [42.2])
        expect(model.distance).to be_a Data::Distance
      end

      it 'defaults to :metric' do
        model = TestClass.new(distance: [42.2])
        expect(model.distance.to_s).to eq '42.2 km'
      end
    end

    context 'when setting to multiple values' do
      it 'initializes a Data::Distance' do
        model = TestClass.new(distance: [42.2, 26.2])
        expect(model.distance).to be_a Data::Distance
      end

      it 'prints correctly (as metric)' do
        model = TestClass.new(distance: [42.2, 26.2])
        expect(model.distance.to_s).to eq '42.2 km'
      end

      it 'prints correctly (as imperial)' do
        model = TestClass.new(distance: [:imperial, 42.2, 26.2])
        expect(model.distance.to_s).to eq '26.2 m'
      end
    end

    context 'when setting with Data::Distance' do
      it 'uses the passed in value' do
        distance = Data::Distance.new(42.2)
        model = TestClass.new(distance: distance)

        expect(model.distance).to eq distance
        expect(model.distance.object_id).to eq distance.object_id
      end
    end
  end
end
