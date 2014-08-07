require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :time_range, Attribute::TimeRange
  end

  RSpec.describe Attribute::TimeRange do
    context 'when setting to nil' do
      it 'initializes a Data::NullTimeRange' do
        model = TestClass.new(time_range: nil)
        expect(model.time_range).to be_a Data::NullTimeRange
      end

      it 'is nil' do
        model = TestClass.new(time_range: nil)
        expect(model.time_range).to be_nil
      end
    end

    context 'when setting to a value' do
      it 'initializes a Data::TimeRange' do
        model = TestClass.new(time_range: [starts_at, ends_at])
        expect(model.time_range).to be_a Data::TimeRange
      end

      it 'sets the value' do
        model = TestClass.new(time_range: [starts_at, ends_at])
        expect(model.time_range.to_s).to eq '2014-02-22 05:00:00 UTC..2014-02-22 17:00:00 UTC'
      end
    end

    context 'when setting with Data::TimeRange' do
      it 'uses the passed in value' do
        time_range = Data::TimeRange.new(starts_at, ends_at)
        model = TestClass.new(time_range: time_range)

        expect(model.time_range).to eq time_range
        expect(model.time_range.object_id).to eq time_range.object_id
      end
    end

    def starts_at
      ::Time.utc(2014, 02, 22, 5, 0, 0)
    end

    def ends_at
      ::Time.utc(2014, 02, 22, 17, 0, 0)
    end
  end
end
