require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :high, Attribute::Temperature
  end
end
