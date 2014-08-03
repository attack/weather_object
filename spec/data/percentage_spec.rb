require_relative '../spec_helper'

module WeatherObject::Data
  RSpec.describe Percentage do
    describe '#initialize' do
      context 'when the input value is < 1' do
        it 'parses the value as out of 1' do
          percentage = Percentage.new(0.5)
          expect(percentage.to_f).to eq 0.5

          percentage = Percentage.new('0.5')
          expect(percentage.to_f).to eq 0.5
        end

        context 'and the input value has a % sign' do
          it 'parses the value as out of 100' do
            percentage = Percentage.new('0.5 %')
            expect(percentage.to_f).to eq 0.005
          end
        end
      end

      context 'when the value is > 1' do
        it 'parses the value as out of 100' do
          percentage = Percentage.new(1.1)
          expect(percentage.to_f).to eq 0.011

          percentage = Percentage.new('1.1')
          expect(percentage.to_f).to eq 0.011
        end
      end

      it 'only retains four significant digits' do
        percentage = Percentage.new(0.54321)
        expect(percentage.to_f).to eq 0.5432
      end
    end

    describe '#to_s' do
      it 'displays using the % sign' do
        percentage = Percentage.new(50)
        expect(percentage.to_s).to eq '50.0 %'
      end
    end
  end
end
