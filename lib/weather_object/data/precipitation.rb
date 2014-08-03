require 'virtus'

module WeatherObject
  module Data
    class Precipitation
      include Virtus.value_object

      attribute :probability, Attribute::Percentage
    end
  end
end
