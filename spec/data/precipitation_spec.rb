require 'spec_helper'

module WeatherObject::Data
  RSpec.describe Precipitation do
    let(:precipitation) { Precipitation.new }

    it { is_expected.to have_field(:type).of_type(String) }

    describe "#probability" do
      it "sets probability percentage" do
        precipitation = Precipitation.new(probability: 50)
        expect(precipitation.probability.to_s).to eq '50.0 %'
      end
    end

    describe "#intensity" do
      it "sets intensity rate" do
        precipitation = Precipitation.new(intensity: 3)
        expect(precipitation.intensity.to_s).to eq '3 mm/hr'
      end
    end
  end
end
