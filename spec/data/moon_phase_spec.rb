require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe MoonPhase do
    describe '#initialize' do
      context 'when the input value is < 1' do
        it 'parses the value as out of 1' do
          moon_phase = MoonPhase.new(0.5)
          expect(moon_phase.to_f).to eq 0.5

          moon_phase = MoonPhase.new('0.5')
          expect(moon_phase.to_f).to eq 0.5
        end

        context 'and the input value has a % sign' do
          it 'parses the value as out of 100' do
            moon_phase = MoonPhase.new('0.5 %')
            expect(moon_phase.to_f).to eq 0.005
          end
        end
      end

      context 'when the value is > 1' do
        it 'parses the value as out of 100' do
          moon_phase = MoonPhase.new(1.1)
          expect(moon_phase.to_f).to eq 0.011

          moon_phase = MoonPhase.new('1.1')
          expect(moon_phase.to_f).to eq 0.011
        end
      end
    end

    describe '#to_s' do
      it 'displays when new moon' do
        moon_phase = MoonPhase.new(0)
        expect(moon_phase.to_s).to eq '0% (new moon)'
      end

      it 'displays when waxing crescent' do
        moon_phase = MoonPhase.new(0.12)
        expect(moon_phase.to_s).to eq '12% (waxing crescent)'
      end

      it 'displays when first quarter moon' do
        moon_phase = MoonPhase.new(0.25)
        expect(moon_phase.to_s).to eq '25% (first quarter moon)'
      end

      it 'displays when waxing gibbous' do
        moon_phase = MoonPhase.new(0.37)
        expect(moon_phase.to_s).to eq '37% (waxing gibbous)'
      end

      it 'displays when full moon' do
        moon_phase = MoonPhase.new(0.5)
        expect(moon_phase.to_s).to eq '50% (full moon)'
      end

      it 'displays when waning gibbous' do
        moon_phase = MoonPhase.new(0.62)
        expect(moon_phase.to_s).to eq '62% (waning gibbous)'
      end

      it 'displays when last quarter moon' do
        moon_phase = MoonPhase.new(0.75)
        expect(moon_phase.to_s).to eq '75% (last quarter moon)'
      end

      it 'displays when waning crescent' do
        moon_phase = MoonPhase.new(0.87)
        expect(moon_phase.to_s).to eq '87% (waning crescent)'
      end
    end
  end
end
