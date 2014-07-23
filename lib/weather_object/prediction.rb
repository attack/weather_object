require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :high, Attribute::Temperature
    attribute :low, Attribute::Temperature
    attribute :pop, Attribute::Float
    attribute :icon, String
    attribute :condition, String
  end
end
