require 'spec_helper'

module WeatherObject
  RSpec.describe Base do
    let(:weather) { Base.new }

    it { is_expected.to have_field(:query).of_type(String) }
    it { is_expected.to have_field(:weight).of_type(Integer) }
    it { is_expected.to have_field(:status_code).of_type(Integer) }

    describe '.new' do
      specify { expect(weather.weight).to eq 1 }
    end
  end
end
