module WeatherObject
  module Attribute
    class TemperatureRange < Virtus::Attribute
      def coerce(value)
        if value.is_a?(Data::TemperatureRange)
          value
        else
          values = Array(value).map{|v| Data::Temperature[v] }
          Data::TemperatureRange.new(*values)
        end
      end
    end
  end
end
