require 'virtus'

module WeatherObject
  class Measurement
    include Virtus.model

    attribute :observed_at, Attribute::Time
    attribute :temperature, Integer
  end
end
