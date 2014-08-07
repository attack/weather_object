require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :rate, Attribute::Rate
  end

  RSpec.describe Attribute::Rate do
    context 'when setting to nil' do
      it 'initializes a Data::NullRate' do
        model = TestClass.new(rate: nil)
        expect(model.rate).to be_a Data::NullRate
      end

      it 'is nil' do
        model = TestClass.new(rate: nil)
        expect(model.rate).to be_nil
      end
    end

    context 'when setting to a single value' do
      it 'initializes a Data::Rate' do
        model = TestClass.new(rate: [3])
        expect(model.rate).to be_a Data::Rate
      end

      it 'defaults to :metric' do
        model = TestClass.new(rate: [3])
        expect(model.rate.to_s).to eq '3 mm/hr'
      end
    end

    context 'when setting to multiple values' do
      it 'initializes a Data::Rate' do
        model = TestClass.new(rate: [3, 0.12])
        expect(model.rate).to be_a Data::Rate
      end

      it 'prints correctly (as metric)' do
        model = TestClass.new(rate: [3, 0.12])
        expect(model.rate.to_s).to eq '3 mm/hr'
      end

      it 'prints correctly (as imperial)' do
        model = TestClass.new(rate: [:imperial, 3, 0.12])
        expect(model.rate.to_s).to eq '0.12 in/hr'
      end
    end

    context 'when setting with Data::Rate' do
      it 'uses the passed in value' do
        rate = Data::Rate.new(3)
        model = TestClass.new(rate: rate)

        expect(model.rate).to eq rate
        expect(model.rate.object_id).to eq rate.object_id
      end
    end
  end
end
