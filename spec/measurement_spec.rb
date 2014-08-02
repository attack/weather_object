require 'spec_helper'

module WeatherObject
  RSpec.describe Measurement do
    let(:measurement) { Measurement.new }

    it { is_expected.to have_field(:observed_at).of_type(Time) }
    it { is_expected.to have_field(:temperature).of_type(Data::Temperature) }
    it { is_expected.to have_field(:dew_point).of_type(Data::Temperature) }
    it { is_expected.to have_field(:heat_index).of_type(Data::Temperature) }
    it { is_expected.to have_field(:wind_chill).of_type(Data::Temperature) }
    it { is_expected.to have_field(:wind).of_type(Data::Vector) }
    it { is_expected.to have_field(:pressure).of_type(Data::Pressure) }
    it { is_expected.to have_field(:visibility).of_type(Data::Distance) }
    it { is_expected.to have_field(:humidity).of_type(Float) }
    it { is_expected.to have_field(:icon).of_type(String) }
    it { is_expected.to have_field(:condition).of_type(String) }

    describe "#daylight" do
      it "sets start and end" do
        sunrise = ::Time.utc(2014, 2, 22, 7, 30, 0)
        sunset = ::Time.utc(2014, 2, 22, 17, 30, 0)
        measurement = Measurement.new(daylight: [sunrise, sunset])

        expect(measurement.daylight.starts_at.to_s).to eq '2014-02-22 07:30:00 UTC'
        expect(measurement.daylight.ends_at.to_s).to eq '2014-02-22 17:30:00 UTC'
      end
    end
  end
end
