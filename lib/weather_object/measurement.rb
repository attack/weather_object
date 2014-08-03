require 'virtus'

module WeatherObject
  class Measurement
    include Virtus.model

    attribute :time, Attribute::Time
    attribute :temperature, Attribute::Temperature
    attribute :apparent_temperature, Attribute::Temperature
    attribute :dew_point, Attribute::Temperature
    attribute :heat_index, Attribute::Temperature
    attribute :wind_chill, Attribute::Temperature
    attribute :wind, Attribute::Vector
    attribute :pressure, Attribute::Pressure
    attribute :visibility, Attribute::Distance
    attribute :humidity, Attribute::Percentage
    attribute :cloud_cover, Attribute::Percentage
    attribute :daylight, Attribute::TimeRange
    attribute :icon, String
    attribute :summary, String
  end
end
