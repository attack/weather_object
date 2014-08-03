module WeatherObject
  module Attribute
    class MoonPhase < Virtus::Attribute
      def coerce(value)
        value.nil? || value.is_a?(Data::MoonPhase) ? value : Data::MoonPhase.new(value)
      end
    end
  end
end
