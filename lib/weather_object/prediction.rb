require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :time, Attribute::TimeRange
    attribute :temperature, Attribute::TemperatureRange
    attribute :pop, Attribute::Float
    attribute :sun, Attribute::Sun
    attribute :icon, String
    attribute :condition, String

    def cover?(query_time)
      time && time.cover?(query_time)
    end
  end
end
