module WeatherObject
  module Attribute
    class Sun < Virtus::Attribute
      def coerce(value)
        if value.nil?
          Data::Sun.new
        elsif value.is_a?(Data::Sun)
          value
        end
      end
    end
  end
end
