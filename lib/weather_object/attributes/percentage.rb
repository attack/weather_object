module WeatherObject
  module Attribute
    class Percentage < Virtus::Attribute
      def coerce(value)
        value ? Data::Percentage.new(value) : default_value.call
      end
    end
  end
end
