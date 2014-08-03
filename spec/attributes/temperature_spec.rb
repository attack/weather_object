require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :temperature, Attribute::Temperature
  end

  RSpec.describe Attribute::Temperature do
    context 'when setting to nil' do
      it 'resets the value' do
        model = TestClass.new(temperature: nil)
        expect(model.temperature).to be_nil
      end
    end

    context 'when setting with data of exact values' do
      it 'initializes Data::Temperature' do
        model = TestClass.new(temperature: [12])
        expect(model.temperature).to be_a Data::Temperature
      end

      it 'defaults to :metric' do
        model = TestClass.new(temperature: [12])
        expect(model.temperature.to_s).to eq '12 C'
      end
    end

    context 'when setting to multiple values' do
      it 'initializes Data::Temperature' do
        model = TestClass.new(temperature: [12, 53])
        expect(model.temperature).to be_a Data::Temperature
      end

      it 'prints correctly (as metric)' do
        model = TestClass.new(temperature: [12, 53])
        expect(model.temperature.to_s).to eq '12 C'
      end

      it 'prints correctly (as imperial)' do
        model = TestClass.new(temperature: [:imperial, 12, 53])
        expect(model.temperature.to_s).to eq '53 F'
      end
    end

    context 'when setting with Data::Temperature' do
      it 'uses the passed in value' do
        temperature = Data::Temperature.new(12)
        model = TestClass.new(temperature: temperature)

        expect(model.temperature).to eq temperature
        expect(model.temperature.object_id).to eq temperature.object_id
      end
    end
  end
end
