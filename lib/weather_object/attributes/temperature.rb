module WeatherObject
  module Attribute
    class Temperature < Virtus::Attribute
      def coerce(value, *args)
        value.is_a?(Data::Temperature) ? value : Data::Temperature.new(*value)
      end
    end
  end
end
