require 'spec_helper'

module WeatherObject
  RSpec.describe Prediction do
    let(:prediction) { Prediction.new }

    it { is_expected.to have_field(:starts_at).of_type(Time) }
    it { is_expected.to have_field(:ends_at).of_type(Time) }
    it { is_expected.to have_field(:high).of_type(Data::Temperature) }
    it { is_expected.to have_field(:low).of_type(Data::Temperature) }
    it { is_expected.to have_field(:pop).of_type(Float) }
    it { is_expected.to have_field(:sun).of_type(Data::Sun) }
    it { is_expected.to have_field(:icon).of_type(String) }
    it { is_expected.to have_field(:condition).of_type(String) }
  end
end
