require 'spec_helper'

module WeatherObject
  RSpec.describe Prediction do
    let(:prediction) { Prediction.new }

    it { is_expected.to have_field(:dew_point).of_type(Data::Temperature) }
    it { is_expected.to have_field(:wind).of_type(Data::Vector) }
    it { is_expected.to have_field(:visibility).of_type(Data::Distance) }
    it { is_expected.to have_field(:icon).of_type(String) }
    it { is_expected.to have_field(:summary).of_type(String) }

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

    describe "#apparent_temperature" do
      it "sets high and low" do
        prediction = Prediction.new(apparent_temperature: [6, 11])

        expect(prediction.apparent_temperature.low.to_s).to eq '6 C'
        expect(prediction.apparent_temperature.high.to_s).to eq '11 C'
      end
    end

    describe "#pop" do
      it "sets pop percentage" do
        prediction = Prediction.new(pop: 50)
        expect(prediction.pop.to_s).to eq '50.0 %'
      end
    end

    describe "#humidity" do
      it "sets humidity percentage" do
        prediction = Prediction.new(humidity: 50)
        expect(prediction.humidity.to_s).to eq '50.0 %'
      end
    end

    describe "#cloud_cover" do
      it "sets cloud_cover percentage" do
        prediction = Prediction.new(cloud_cover: 50)
        expect(prediction.cloud_cover.to_s).to eq '50.0 %'
      end
    end

    describe "#daylight" do
      it "sets start and end" do
        sunrise = ::Time.utc(2014, 2, 22, 7, 30, 0)
        sunset = ::Time.utc(2014, 2, 22, 17, 30, 0)
        prediction = Prediction.new(daylight: [sunrise, sunset])

        expect(prediction.daylight.starts_at.to_s).to eq '2014-02-22 07:30:00 UTC'
        expect(prediction.daylight.ends_at.to_s).to eq '2014-02-22 17:30:00 UTC'
      end
    end

    describe "#moon_phase" do
      it "sets moon_phase percentage" do
        prediction = Prediction.new(moon_phase: 50)
        expect(prediction.moon_phase.to_s).to eq '50% (full moon)'
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
