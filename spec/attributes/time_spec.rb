require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :time, Attribute::Time
  end

  RSpec.describe Attribute::Time do
    context 'when nothing has been set' do
      it 'returns nil' do
        model = TestClass.new(time: nil)
        expect(model.time).to be_nil
      end
    end

    context 'when setting with data to be interpretted as a time' do
      it 'sets the value' do
        model = TestClass.new(time: [2012, 10, 4, 5, 30, 45])
        expect(model.time).to eq ::Time.utc(2012, 10, 4, 5, 30, 45)
      end
    end

    context 'when setting with data to parse' do
      it 'sets the value' do
        model = TestClass.new(time: '2012-10-4 5:30:45 pm UTC')
        expect(model.time).to eq ::Time.utc(2012, 10, 4, 17, 30, 45)
      end
    end

    context 'when setting with data to parse (including format)' do
      it 'sets the value' do
        model = TestClass.new(time: ['2012-10-04', '%Y-%d-%m'])
        expect(model.time).to eq ::Time.utc(2012, 4, 10)
      end
    end

    context 'when setting with Time' do
      it 'uses the passed in value' do
        time = ::Time.now.utc
        model = TestClass.new(time: time)

        expect(model.time).to be_a ::Time
        expect(model.time.object_id).to eq time.object_id
      end
    end
  end
end
