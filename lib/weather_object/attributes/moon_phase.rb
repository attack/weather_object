module WeatherObject
  module Attribute
    class MoonPhase < Virtus::Attribute
      def coerce(value)
        value.is_a?(Data::MoonPhase) ? value : Data::MoonPhase.new(value.to_f)
      end
    end
  end
end
