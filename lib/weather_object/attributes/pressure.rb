module WeatherObject
  module Attribute
    class Pressure < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullPressure.new
        elsif value.is_a? Data::Pressure
          value
        else
          Data::Pressure.new(*value)
        end
      end
    end
  end
end
