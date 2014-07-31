require 'spec_helper'

module WeatherObject
  RSpec.describe Prediction do
    let(:prediction) { Prediction.new }

    it { is_expected.to have_field(:pop).of_type(Float) }
    it { is_expected.to have_field(:sun).of_type(Data::Sun) }
    it { is_expected.to have_field(:icon).of_type(String) }
    it { is_expected.to have_field(:condition).of_type(String) }

    describe "#time" do
      it "sets start and end" do
        starts_at = ::Time.utc(2014, 2, 22, 0, 0, 0)
        ends_at = ::Time.utc(2014, 2, 22, 23, 59, 59)
        prediction = Prediction.new(time: [starts_at, ends_at])

        expect(prediction.time.starts_at.to_s).to eq '2014-02-22 00:00:00 UTC'
        expect(prediction.time.ends_at.to_s).to eq '2014-02-22 23:59:59 UTC'
      end
    end

    describe "#temperature" do
      it "sets high and low" do
        prediction = Prediction.new(temperature: [5, 10])

        expect(prediction.temperature.low.to_s).to eq '5 C'
        expect(prediction.temperature.high.to_s).to eq '10 C'
      end
    end

    describe "#cover?" do
      it "returns true if the valid_date range includes the given date" do
        prediction = Prediction.new(
          time: [
            ::Time.utc(2014, 2, 22, 0, 0, 0),
            ::Time.utc(2014, 2, 22, 23, 59, 59)
          ]
        )
        expect(prediction.cover?(::Time.utc(2014, 2, 22, 12, 0, 0))).to be true
      end

      it "returns false if the valid_date range excludes the given date" do
        prediction = Prediction.new(
          time: [
            ::Time.utc(2014, 2, 22, 0, 0, 0),
            ::Time.utc(2014, 2, 22, 23, 59, 59)
          ]
        )
        expect(prediction.cover?(::Time.utc(2014, 3, 1, 12, 0, 0))).to be false
      end
    end
  end
end
