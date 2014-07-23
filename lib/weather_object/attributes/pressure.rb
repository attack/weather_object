module WeatherObject
  module Attribute
    class Pressure < Virtus::Attribute
      def coerce(value, *args)
        value.is_a?(Data::Pressure) ? value : Data::Pressure.new(*value)
      end
    end
  end
end
