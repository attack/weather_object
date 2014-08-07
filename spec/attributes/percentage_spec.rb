require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :percentage, Attribute::Percentage
  end

  RSpec.describe Attribute::Percentage do
    context 'when setting to nil' do
      it 'is nil' do
        model = TestClass.new(percentage: nil)
        expect(model.percentage).to be_nil
      end
    end

    context 'when setting to a percentage' do
      it 'sets the value to the percentage' do
        model = TestClass.new(percentage: '75%')
        expect(model.percentage.to_f).to eq 0.75
      end
    end

    context 'when setting with Data::Percentage' do
      it 'uses the passed in value' do
        percentage = Data::Percentage.new(0.5)
        model = TestClass.new(percentage: percentage)

        expect(model.percentage).to eq percentage
        expect(model.percentage.object_id).to eq percentage.object_id
      end
    end
  end
end
