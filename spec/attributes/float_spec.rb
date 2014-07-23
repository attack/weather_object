require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :float, Attribute::Float
  end

  RSpec.describe Attribute::Float do
    let(:model) { TestClass.new }

    context 'when setting to nil' do
      it 'resets the value' do
        model.float = 75.0
        model.float = nil
        expect( model.float ).to be_nil
      end
    end

    context 'when setting to a convertable value' do
      it 'initializes a Float' do
        model.float = '75%'
        expect( model.float ).to be_a Float
      end

      it 'prints correctly' do
        model.float = '75%'
        expect( model.float.to_s ).to eq '75.0'
      end
    end

    context 'when setting with data of exact values' do
      it 'initializes a Float' do
        model.float = 65.0
        expect( model.float ).to be_a Float
      end

      it 'prints correctly' do
        model.float = 65.0
        expect( model.float.to_s ).to eq '65.0'
      end
    end
  end
end
