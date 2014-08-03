require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :percentage, Attribute::Percentage
  end

  RSpec.describe Attribute::Percentage do
    let(:model) { TestClass.new }

    context 'when setting to nil' do
      it 'sets the value to nil' do
        model = TestClass.new(percentage: nil)
        expect(model.percentage).to be_nil
      end
    end

    context 'when setting to a percentage' do
      it 'responds with a Float' do
        model = TestClass.new(percentage: '75%')
        expect(model.percentage.to_f).to be_a Float
      end

      it 'prints correctly' do
        model = TestClass.new(percentage: '75%')
        expect(model.percentage.to_s).to eq '75.0 %'
      end
    end
  end
end
