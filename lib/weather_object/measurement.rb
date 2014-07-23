require 'virtus'

module WeatherObject
  class Measurement
    include Virtus.model

    attribute :observed_at, Attribute::Time
    attribute :temperature, Attribute::Temperature
    attribute :dew_point, Attribute::Temperature
    attribute :heat_index, Attribute::Temperature
    attribute :wind_chill, Attribute::Temperature
  end
end
