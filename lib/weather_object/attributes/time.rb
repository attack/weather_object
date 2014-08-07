module WeatherObject
  module Attribute
    class Time < Virtus::Attribute
      def coerce(value, *args)
        if value.nil? || value.is_a?(::Time)
          value
        else
          Utils::Time.parse(*value)
        end
      end
    end
  end
end
