module WeatherObject
  module Attribute
    class Zone < Virtus::Attribute
      def coerce(value)
        value.nil? || value.is_a?(Data::Zone) ? value : raise(ArgumentError)
      end
    end
  end
end
