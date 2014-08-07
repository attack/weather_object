module WeatherObject
  module Attribute
    class MoonPhase < Virtus::Attribute
      def coerce(value, *args)
        if value.nil? || value.is_a?(Data::MoonPhase)
          value
        else
          Data::MoonPhase.new(value)
        end
      end
    end
  end
end
