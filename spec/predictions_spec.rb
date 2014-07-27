require 'spec_helper'

module WeatherObject
  RSpec.describe Predictions do
    let(:predictions) { Predictions.new }

    describe "#for" do
      let(:tommorrow) { ::Date.new(2014, 2, 23) }

      context "when there are no predictions" do
        specify { expect( predictions.for(tommorrow) ).to be_nil }
      end

      context "when there are predictions" do
        before do
          start_time = ::Time.utc(2014, 2, 22, 0, 0, 0)
          end_time = ::Time.utc(2014, 2, 22, 23, 59, 59)
          one_day_in_seconds = (60 * 60 * 24)

          0.upto(3) do |i|
            predictions.add(Prediction.new(
              starts_at: start_time + (i * one_day_in_seconds),
              ends_at: end_time + (i * one_day_in_seconds)
            ))
          end
        end

        it "finds the date using a String" do
          expect( predictions.for(tommorrow.to_s) ).to eq predictions.to_a[1]
        end

        it "finds the date using a Date" do
          expect( predictions.for(tommorrow) ).to eq predictions.to_a[1]
        end

        it "finds the date using a DateTime" do
          datetime = ::DateTime.new(tommorrow.year, tommorrow.month, tommorrow.day)
          expect( predictions.for(datetime) ).to eq predictions.to_a[1]
        end

        it "finds the date using a Time" do
          time = ::Time.parse(tommorrow.to_s)
          expect( predictions.for(time) ).to eq predictions.to_a[1]
        end

        it "finds the date using Data::Time" do
          time = Utils::Time.parse(tommorrow.to_s)
          expect( predictions.for(time) ).to eq predictions.to_a[1]
        end

        it "finds nothing when there is not a match" do
          expect( predictions.for(::Date.today - 1) ).to be_nil
        end
      end
    end
  end
end
