module WeatherObject
  module Attribute
    class Vector < Virtus::Attribute
      def coerce(value)
        value.is_a?(Data::Vector) ? value : Data::Vector.new(*value)
      end
    end
  end
end
