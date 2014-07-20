require 'spec_helper'

module WeatherObject
  RSpec.describe Measurement do
    let(:measurement) { Measurement.new }

    it { is_expected.to have_field(:observed_at).of_type(Time) }
    it { is_expected.to have_field(:temperature).of_type(Data::Temperature) }
  end
end
