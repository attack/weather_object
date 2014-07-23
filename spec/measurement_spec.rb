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
    it { is_expected.to have_field(:sun).of_type(Data::Sun) }
    it { is_expected.to have_field(:icon).of_type(String) }
    it { is_expected.to have_field(:condition).of_type(String) }
  end
end
