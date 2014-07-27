module WeatherObject
  module Attribute
    class Float < Virtus::Attribute
      def coerce(value, *args)
        value ? value.to_f : default_value.call
      end
    end
  end
end
