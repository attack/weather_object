require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :ozone, Attribute::Ozone
  end

  RSpec.describe Attribute::Percentage do
    context 'when setting to nil' do
      it 'sets the value to nil' do
        model = TestClass.new(ozone: nil)
        expect(model.ozone).to be_nil
      end
    end

    context 'when setting to a magnitude' do
      it 'responds with an Ozone' do
        model = TestClass.new(ozone: 2)
        expect(model.ozone).to be_a Data::Ozone
      end

      it 'prints correctly' do
        model = TestClass.new(ozone: 2)
        expect(model.ozone.to_s).to eq '2 DU'
      end
    end

    context 'when setting with Data::Ozone' do
      it 'uses the passed in value' do
        ozone = Data::Ozone.new(2)
        model = TestClass.new(ozone: ozone)

        expect(model.ozone).to eq ozone
        expect(model.ozone.object_id).to eq ozone.object_id
      end
    end
  end
end
