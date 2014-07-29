require 'spec_helper'

module WeatherObject
  RSpec.describe Prediction do
    let(:prediction) { Prediction.new }

    it { is_expected.to have_field(:starts_at).of_type(Time) }
    it { is_expected.to have_field(:ends_at).of_type(Time) }
    it { is_expected.to have_field(:pop).of_type(Float) }
    it { is_expected.to have_field(:sun).of_type(Data::Sun) }
    it { is_expected.to have_field(:icon).of_type(String) }
    it { is_expected.to have_field(:condition).of_type(String) }

    describe "#temperature" do
      it "sets high and low" do
        prediction = Prediction.new(temperature: [5, 10])

        expect(prediction.temperature.low.to_s).to eq '5 C'
        expect(prediction.temperature.high.to_s).to eq '10 C'
      end
    end

    describe "#covers?" do
      it "returns true if the valid_date range includes the given date" do
        prediction = Prediction.new(
          starts_at: ::Time.utc(2014, 2, 22, 0, 0, 0),
          ends_at: ::Time.utc(2014, 2, 22, 23, 59, 59)
        )
        expect(prediction.covers?(::Time.utc(2014, 2, 22, 12, 0, 0))).to be true
      end

      it "returns false if the valid_date range excludes the given date" do
        prediction = Prediction.new(
          starts_at: ::Time.utc(2014, 2, 22, 0, 0, 0),
          ends_at: ::Time.utc(2014, 2, 22, 23, 59, 59)
        )
        expect(prediction.covers?(::Time.utc(2014, 3, 1, 12, 0, 0))).to be false
      end
    end
  end
end
