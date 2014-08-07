require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :location, Attribute::Location
  end

  RSpec.describe Attribute::Location do
    context 'when setting to nil' do
      it 'initializes a Data::NullLocation' do
        model = TestClass.new(location: nil)
        expect(model.location).to be_a Data::NullLocation
      end

      it 'is nil' do
        model = TestClass.new(location: nil)
        expect(model.location).to be_nil
      end
    end

    context 'when setting with valid data' do
      it 'sets the value' do
        model = TestClass.new(location: {
          name: 'New York'
        })

        expect(model.location.name).to eq 'New York'
      end
    end

    context 'when setting with invalid data' do
      it 'raises an error' do
        expect {
          TestClass.new(location: 'foo')
        }.to raise_error { ArgumentError }
      end
    end

    context 'when setting with Data::Location' do
      it 'uses the passed in value' do
        location = Data::Location.new(name: 'foo')
        model = TestClass.new(location: location)

        expect(model.location).to eq location
        expect(model.location.object_id).to eq location.object_id
      end
    end
  end
end
