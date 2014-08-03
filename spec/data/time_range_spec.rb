require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe TimeRange do
    let(:low) { ::Time.utc(2014, 02, 22, 5, 0, 0) }
    let(:mid) { ::Time.utc(2014, 02, 22, 12, 0, 0) }
    let(:high) { ::Time.utc(2014, 02, 22, 19, 0, 0) }

    describe '#starts_at' do
      it 'sets the starts_at' do
        time_range = TimeRange.new(low, high)
        expect(time_range.starts_at).to eq low
      end

      it 'raises an error when not given' do
        expect {
          TimeRange.new(nil, high)
        }.to raise_error
      end

      it 'raises an error when not a ::Time' do
        expect {
          TimeRange.new(5, high)
        }.to raise_error
      end
    end

    describe '#ends_at' do
      it 'sets the ends_at' do
        time_range = TimeRange.new(low, high)
        expect(time_range.ends_at).to eq high
      end

      it 'raises an error when not given' do
        expect {
          TimeRange.new(low, nil)
        }.to raise_error
      end

      it 'raises an error when not a ::Time' do
        expect {
          TimeRange.new(low, 5)
        }.to raise_error
      end
    end

    describe '#cover?' do
      let(:time_range) { TimeRange.new(low, high) }

      specify { expect(time_range.cover?(low)).to be true }
      specify { expect(time_range.cover?(mid)).to be true }
      specify { expect(time_range.cover?(high)).to be true }

      specify { expect(time_range.cover?(::Time.utc(2014, 02, 22, 1, 0, 0))).to be false }
      specify { expect(time_range.cover?(::Time.utc(2014, 02, 22, 23, 0, 0))).to be false }
    end

    describe '#size' do
      it 'returns the number of seconds convered by the range' do
        time_range = TimeRange.new(mid, mid + 100)
        expect(time_range.size).to eq 100
      end
    end

    describe '#to_s' do
      it 'prints the range' do
        time_range = TimeRange.new(low, high)
        expect(time_range.to_s).to eq '2014-02-22 05:00:00 UTC..2014-02-22 19:00:00 UTC'
      end
    end
  end
end
