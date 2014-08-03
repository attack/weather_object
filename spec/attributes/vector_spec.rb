require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :vector, Attribute::Vector
  end

  RSpec.describe Attribute::Vector do
    let(:model) { TestClass.new }

    context 'when setting to nil' do
      it 'sets the value' do
        model = TestClass.new(vector: nil)
        expect(model.vector).to be_nil
      end
    end

    context 'when setting with data of exact values' do
      it 'initializes Data::Vector' do
        model = TestClass.new(vector: [12, 270])
        expect(model.vector).to be_a Data::Vector
      end

      it 'prints correctly' do
        model = TestClass.new(vector: [12])
        expect(model.vector.to_s).to eq '12 kph'
      end
    end

    context 'when setting with Data::Vector' do
      it 'uses the passed in value' do
        vector = Data::Vector.new(12, 270)
        model = TestClass.new(vector: vector)

        expect(model.vector).to eq vector
        expect(model.vector.object_id).to eq vector.object_id
      end
    end
  end
end
