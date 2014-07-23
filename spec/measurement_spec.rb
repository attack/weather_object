require 'spec_helper'

module WeatherObject
  RSpec.describe Measurement do
    let(:measurement) { Measurement.new }

    it { is_expected.to have_field(:observed_at).of_type(Time) }
    it { is_expected.to have_field(:temperature).of_type(Data::Temperature) }
    it { is_expected.to have_field(:dew_point).of_type(Data::Temperature) }
    it { is_expected.to have_field(:heat_index).of_type(Data::Temperature) }
    it { is_expected.to have_field(:wind_chill).of_type(Data::Temperature) }
  end
end
