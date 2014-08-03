require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :time, Attribute::TimeRange
    attribute :temperature, Attribute::TemperatureRange
    attribute :apparent_temperature, Attribute::TemperatureRange
    attribute :pop, Attribute::Percentage
    attribute :humidity, Attribute::Percentage
    attribute :wind, Attribute::Vector
    attribute :dew_point, Attribute::Temperature
    attribute :visibility, Attribute::Distance
    attribute :cloud_cover, Attribute::Percentage
    attribute :daylight, Attribute::TimeRange
    attribute :icon, String
    attribute :summary, String

    def cover?(query_time)
      time && time.cover?(query_time)
    end
  end
end
