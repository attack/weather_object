require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :time, Attribute::TimeRange
    attribute :temperature, Attribute::TemperatureRange
    attribute :pop, Attribute::Float
    attribute :humidity, Attribute::Float
    attribute :dew_point, Attribute::Temperature
    attribute :visibility, Attribute::Distance
    attribute :cloud_cover, Attribute::Float
    attribute :sun, Attribute::Sun
    attribute :icon, String
    attribute :summary, String

    def cover?(query_time)
      time && time.cover?(query_time)
    end
  end
end
