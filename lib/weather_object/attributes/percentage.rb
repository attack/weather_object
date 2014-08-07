module WeatherObject
  module Attribute
    class Percentage < Virtus::Attribute
      def coerce(value, *args)
        if value.nil? || value.is_a?(Data::Percentage)
          value
        else
          Data::Percentage.new(value)
        end
      end
    end
  end
end
