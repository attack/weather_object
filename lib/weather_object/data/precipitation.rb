require 'virtus'

module WeatherObject
  module Data
    class Precipitation
      include Virtus.value_object

      attribute :probability, Attribute::Percentage
      attribute :type, String
      attribute :intensity, Attribute::Rate
    end
  end
end
