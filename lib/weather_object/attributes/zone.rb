module WeatherObject
  module Attribute
    class Zone < Virtus::Attribute
      def coerce(value)
        value.nil? || value.is_a?(Data::Zone) ? value : Data::Zone.new(value)
      end
    end
  end
end
