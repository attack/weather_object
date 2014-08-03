require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :timezone, Attribute::Zone
  end

  RSpec.describe Attribute::Zone do
    context 'when nothing has been set' do
      it 'returns nil' do
        model = TestClass.new(timezone: nil)
        expect(model.timezone).to be_nil
      end
    end

    context 'when setting with valid data' do
      it 'sets the value' do
        model = TestClass.new(timezone: 'MST')
        expect(model.timezone.to_s).to eq 'MST'
      end
    end

    context 'when setting with a Data::Zone' do
      it 'sets the value' do
        zone = Data::Zone.new('PDT')
        model = TestClass.new(timezone: zone)

        expect(model.timezone).to eq zone
        expect(model.timezone.code).to eq 'PDT'
      end
    end
  end
end
