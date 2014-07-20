require 'virtus'

module WeatherObject
  class Prediction
    include Virtus.model

    attribute :high, Integer
  end
end
