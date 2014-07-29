require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :starts_at, Attribute::Time
    attribute :ends_at, Attribute::Time
    attribute :temperature, Attribute::TemperatureRange
    attribute :pop, Attribute::Float
    attribute :sun, Attribute::Sun
    attribute :icon, String
    attribute :condition, String

    def covers?(time)
      raise ArgumentError unless time.is_a?(Time)
      time >= starts_at && time <= ends_at
    end
  end
end
