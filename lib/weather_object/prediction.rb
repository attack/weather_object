require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.value_object

    attribute :time, Attribute::TimeRange
    attribute :temperature, Attribute::TemperatureRange
    attribute :apparent_temperature, Attribute::TemperatureRange
    attribute :humidity, Attribute::Percentage
    attribute :wind, Attribute::Vector
    attribute :dew_point, Attribute::Temperature
    attribute :visibility, Attribute::Distance
    attribute :cloud_cover, Attribute::Percentage
    attribute :daylight, Attribute::TimeRange
    attribute :moon_phase, Attribute::MoonPhase
    attribute :ozone, Attribute::Ozone
    attribute :icon, String
    attribute :summary, String
    attribute :precipitation, Data::Precipitation

    def pop
      precipitation.probability
    end

    def cover?(query_time)
      time && time.cover?(query_time)
    end
  end
end
