module WeatherObject
  module Attribute
    class Distance < Virtus::Attribute
      def coerce(value, *args)
        value.is_a?(Data::Distance) ? value : Data::Distance.new(*value)
      end
    end
  end
end
