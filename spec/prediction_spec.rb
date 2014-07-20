require 'spec_helper'

module WeatherObject
  RSpec.describe Prediction do
    let(:prediction) { Prediction.new }

    it { is_expected.to have_field(:high).of_type(Integer) }
  end
end
