module WeatherObject
  module Attribute
    class Temperature < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullTemperature.new
        elsif value.is_a? Data::Temperature
          value
        else
          Data::Temperature.new(*value)
        end
      end
    end
  end
end
