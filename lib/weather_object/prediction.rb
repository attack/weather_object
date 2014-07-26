require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :starts_at, Attribute::Time
    attribute :ends_at, Attribute::Time
    attribute :high, Attribute::Temperature
    attribute :low, Attribute::Temperature
    attribute :pop, Attribute::Float
    attribute :sun, Attribute::Sun
    attribute :icon, String
    attribute :condition, String
  end
end
