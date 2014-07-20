require 'spec_helper'

module WeatherObject
  RSpec.describe Base do
    let(:weather) { Base.new }

    it { is_expected.to have_field(:query).of_type(String) }
    it { is_expected.to have_field(:weight).of_type(Integer) }
    it { is_expected.to have_field(:status_code).of_type(Integer) }

    describe '.new' do
      specify { expect(weather.weight).to eq 1 }
    end

    describe '#current' do
      it 'finds the most recent measurement' do
        weather.add_measurement(observed_at: yesterday)
        weather.add_measurement(observed_at: now)
        weather.add_measurement(observed_at: yesterday)

        expect(weather.current.observed_at).to eq now
      end

      def now
        @now ||= Time.now.utc
      end

      def yesterday
        now - (60 * 60 * 24)
      end
    end

    describe '#add_measurement' do
      it 'creates a measurement' do
        measurement_values = double(:hash)
        allow(Measurement).to receive(:new)

        weather.add_measurement(measurement_values)

        expect(Measurement).to have_received(:new).with(measurement_values)
      end

      it 'adds the measurement to the list of historical data' do
        measurement = double(:measurement)
        allow(Measurement).to receive(:new).and_return(measurement)

        weather.add_measurement

        expect(weather.history.member?(measurement)).to be true
      end
    end
  end
end
