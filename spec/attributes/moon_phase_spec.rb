require_relative '../spec_helper'
require 'virtus'

module WeatherObject
  class TestClass
    include Virtus.model
    attribute :moon_phase, Attribute::MoonPhase
  end

  RSpec.describe Attribute::MoonPhase do
    context 'when setting to nil' do
      it 'sets the value to nil' do
        model = TestClass.new(moon_phase: nil)
        expect(model.moon_phase).to be_nil
      end
    end

    context 'when setting to a percentage' do
      it 'sets the value to the percentage' do
        model = TestClass.new(moon_phase: '50%')
        expect(model.moon_phase.to_f).to eq 0.5
      end
    end

    context 'when setting with Data::MoonPhase' do
      it 'uses the passed in value' do
        moon_phase = Data::MoonPhase.new(0.5)
        model = TestClass.new(moon_phase: moon_phase)

        expect(model.moon_phase).to eq moon_phase
        expect(model.moon_phase.object_id).to eq moon_phase.object_id
      end
    end
  end
end
