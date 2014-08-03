require 'spec_helper'

module WeatherObject::Data
  RSpec.describe Precipitation do
    describe "#probability" do
      it "sets probability percentage" do
        precipitation = Precipitation.new(probability: 50)
        expect(precipitation.probability.to_s).to eq '50.0 %'
      end
    end
  end
end
