module WeatherObject
  module Attribute
    class Location < Virtus::Attribute
      def coerce(value)
        value.is_a?(Data::Location) ? value : Data::Location.new(*value)
      end
    end
  end
end
