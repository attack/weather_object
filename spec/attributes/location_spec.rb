require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :location, Attribute::Location
  end

  RSpec.describe Attribute::Location do
    context 'when setting to nil' do
      it 'sets the value' do
        model = TestClass.new(location: nil)

        expect(model.location).to be_a Data::Location
        expect(model.location.to_s).to be_empty
      end
    end

    context 'when setting with invalid data' do
      it 'raises an error' do
        expect {
          TestClass.new(location: 'foo')
        }.to raise_error{ ArgumentError }
      end
    end

    context 'when setting with a location' do
      it 'sets the value' do
        location = Data::Location.new(name: 'foo')
        model = TestClass.new(location: location)

        expect(model.location).to eq location
        expect(model.location.object_id).to eq location.object_id
      end
    end
  end
end
