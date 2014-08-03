module WeatherObject
  module Attribute
    class Percentage < Virtus::Attribute
      def coerce(value)
        value.nil? || value.is_a?(Data::Percentage) ? value : Data::Percentage.new(value)
      end
    end
  end
end
