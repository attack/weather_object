module WeatherObject
  module Attribute
    class Ozone < Virtus::Attribute
      def coerce(value)
        value.nil? || value.is_a?(Data::Ozone) ? value : Data::Ozone.new(value)
      end
    end
  end
end
