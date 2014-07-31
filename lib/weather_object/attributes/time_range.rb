module WeatherObject
  module Attribute
    class TimeRange < Virtus::Attribute
      def coerce(value)
        if value.nil? || value.is_a?(Data::TimeRange)
          value
        else
          Data::TimeRange.new(*value)
        end
      end
    end
  end
end
