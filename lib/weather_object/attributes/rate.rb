module WeatherObject
  module Attribute
    class Rate < Virtus::Attribute
      def coerce(value)
        value.is_a?(Data::Rate) ? value : Data::Rate.new(*value)
      end
    end
  end
end
