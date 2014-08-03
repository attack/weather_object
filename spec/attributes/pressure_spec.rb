require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :pressure, Attribute::Pressure
  end

  RSpec.describe Attribute::Pressure do
    context 'when setting to nil' do
      it 'sets the value' do
        model = TestClass.new(pressure: nil)
        expect(model.pressure).to be_nil
      end
    end

    context 'when setting with data of exact values' do
      it 'initializes Data::Pressure' do
        model = TestClass.new(pressure: [12])
        expect(model.pressure).to be_a Data::Pressure
      end

      it 'prints correctly' do
        model = TestClass.new(pressure: [12])
        expect(model.pressure.to_s).to eq '12 mb'
      end
    end

    context 'when setting to multiple values' do
      it 'initializes Data::Pressure' do
        model = TestClass.new(pressure: [1234, 36])
        expect(model.pressure).to be_a Data::Pressure
      end

      it 'prints correctly (as metric)' do
        model = TestClass.new(pressure: [1234, 36])
        expect(model.pressure.to_s).to eq '1234 mb'
      end

      it 'prints correctly (as imperial)' do
        model = TestClass.new(pressure: [:imperial, 1234, 36])
        expect(model.pressure.to_s).to eq '36 in'
      end
    end

    context 'when setting with Data::Pressure' do
      it 'uses the passed in value' do
        pressure = Data::Pressure.new(12)
        model = TestClass.new(pressure: pressure)

        expect(model.pressure).to eq pressure
        expect(model.pressure.object_id).to eq pressure.object_id
      end
    end
  end
end
