module WeatherObject
  module Attribute
    class Zone < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullZone.new
        elsif value.is_a?(Data::Zone)
          value
        else
          Data::Zone.new(value)
        end
      end
    end
  end
end
